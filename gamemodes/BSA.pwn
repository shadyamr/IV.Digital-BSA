/*
*	  _______      _______  _       _ _        _ 
*	 |_   _\ \    / /  __ \(_)     (_) |      | |
*	   | |  \ \  / /| |  | |_  __ _ _| |_ __ _| |
*	   | |   \ \/ / | |  | | |/ _` | | __/ _` | |
*	  _| |_   \  / _| |__| | | (_| | | |_ (_| | |
*	 |_____|   \/ (_)_____/|_|\__, |_|\__\__,_|_|
*	                           __/ |             
*	                          |___/                      
*
*	IV.Digital - Battlefield: San Andreas by Shady Amr (ItzShady)
*	https://forum.sa-mp.com/member.php?u=240484
*	https://github.com/shadyamr
*
*	Script begun: March 20th, 2019
*
*	Copyright © 2019 by IV.Digital, All rights reserved. 
*	No part of this publication may be reproduced, distributed, or transmitted in any form or by any means, including
*	photocopying, recording, or other electronic or mechanical methods, without the prior written permission of the publisher, 
*	except in the case of brief quotations embodied in critical reviews and certain other noncommercial uses permitted by copyright law.
*	For permission requests, write to the publisher, addressed “Attention: Permissions Coordinator,” at the address below.
*
*/

#include <a_samp>
#include <a_mysql>
#include <bcrypt>
#include <crashdetect>
#include <discord-connector>
#include <easyDialog>
#include <foreach>
#include <izcmd>
#include <sscanf2>
#include <streamer>

#include "../gamemodes/assets/defvarenu.bsa"
#include "../gamemodes/assets/functions.bsa"
#include "../gamemodes/assets/svrconfig.bsa"

main( ) { }

public OnGameModeInit()
{
	SendRconCommand("hostname "SVR_NAME"");
    SendRconCommand("rcon_password "SVR_RCON"");
    SendRconCommand("weburl "SVR_WEBSITE"");
    SendRconCommand("mapname "SVR_LOCATION"");
    SendRconCommand("language "SVR_LANGUAGE"");
    //SendRconCommand("password "SVR_PASSWORD"");
	SetGameModeText(SVR_GMTEXT);

	Database = mysql_connect(MYSQL_HOSTNAME, MYSQL_USERNAME, MYSQL_PASSWORD, MYSQL_DATABASE);
	if(Database == MYSQL_INVALID_HANDLE || mysql_errno(Database) != 0)
	{
		print("BSA Local: MySQL Connection failed, shutting the server down!");
		SendRconCommand("exit");
		return true;
	}

	mysql_log(ALL);
	DiscordInit();
	print("BSA Local: MySQL Connection was successful.");
	return true;
}

public OnGameModeExit()
{
	DiscordExit();
}

public OnPlayerConnect(playerid)
{
	new string[256], query[256];
	DefaultValues(playerid);
	SendClientMessage(playerid, COLOR_WHITE, "Welcome to {3498db}Battlefield: San Andreas {FFFFFF}[Version "SVR_VERSION" | "SVR_WEBSITE"]");

	mysql_format(Database, query, sizeof(query), "SELECT * FROM `players` WHERE `Username` = '%e'", GetName(playerid));
	mysql_tquery(Database, query, "CheckAccount", "d", playerid);

	if(_:logchannel == 0) logchannel = DCC_FindChannelById("557714574883684353");
	format(string, sizeof(string), "BSA Local: %s has joined the server (IP: %s || %s)", GetName(playerid), ReturnIP(playerid), GetDate());
	DCC_SendChannelMessage(logchannel, string);
	return true;
}

public OnPlayerDisconnect(playerid, reason)
{
	new query[200], userip[20], str[256];
	new szDisconnectReason[3][] =
    {
        "Timeout/Crash",
        "Quit",
        "Kick/Ban"
    };

	mysql_format(Database, query, sizeof(query), "UPDATE `players` SET `Cash` = '%i', `Kills` = '%i', `Deaths` = '%i' WHERE `ID` = '%i'", PlayerInfo[playerid][user_cash], PlayerInfo[playerid][user_kills], PlayerInfo[playerid][user_deaths], PlayerInfo[playerid][user_id]);
	mysql_query(Database, query);
	DefaultValues(playerid);
	GetPlayerIp(playerid, userip, sizeof(userip));

	if(_:logchannel == 0) logchannel = DCC_FindChannelById("557714574883684353");
	format(str, sizeof(str), "BSA Local: %s has left the server (Reason: %s || %s)", GetName(playerid), szDisconnectReason[reason], ReturnIP(playerid), GetDate());
	DCC_SendChannelMessage(logchannel, str);
	return true;
}

public OnPlayerSpawn(playerid)
{
	return true;
}

public OnPlayerRequestClass(playerid, classid)
{
	return true;
}

public OnPlayerText(playerid, text[])
{
	new msg[256];
	if(InLobby[playerid])
	{
		format(msg, sizeof(msg), "[Lobby]{FFFFFF} %s: %s", GetName(playerid), text);
		SendClientMessageToAll(COLOR_LIGHTRED, msg);
	}
	return false;
}

public OnPlayerFinishedDownloading(playerid, virtualworld)
{
	SendSuccessMessage(playerid, "You have successfully downloaded the custom models.");
    return true;
}

Dialog:DIALOG_REGISTER(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		bcrypt_hash(inputtext, BCRYPT_COST, "OnPasswordHashed", "d", playerid);
	}
	else
		Kick(playerid);
	return true;
}

Dialog:DIALOG_LOGIN(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new query[300], Password[BCRYPT_HASH_LENGTH];
		mysql_format(Database, query, sizeof(query), "SELECT `Password` FROM `players` WHERE `Username` = '%e'", GetName(playerid));
		mysql_query(Database, query);
		cache_get_value_name(0, "Password", Password, BCRYPT_HASH_LENGTH);
		bcrypt_check(inputtext, Password, "OnPasswordChecked", "d", playerid);
	}
	else
		Kick(playerid);
	return true;
}

CMD:changepassword(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "{FFFFFF}Password Change\nInput the new password you want to have for your account.");
	Dialog_Show(playerid, DIALOG_PASSWORDCHANGE, DIALOG_STYLE_PASSWORD, "Change your password", string, "Change", "Close");
	return true;
}

CMD:test(playerid, params[])
{
	new string[128];
	if(_:logchannel == 0) logchannel = DCC_FindChannelById("557714574883684353");
	format(string, sizeof(string), "Created by Shady and Jack F. Dunford. #");
	DCC_SendChannelMessage(logchannel, string);
	return true;
}

Dialog:DIALOG_PASSWORDCHANGE(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		bcrypt_hash(inputtext, BCRYPT_COST, "OnPasswordChanged", "i", playerid);
	}
	return true;
}