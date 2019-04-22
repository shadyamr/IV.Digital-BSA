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
#include <geolite>
#include <izcmd>
#include <sscanf2>
#include <streamer>
#include <YSI\y_hooks>

new MySQL:g_Sql;

/* ANTI-CHEAT */
#include "./includes/anticheat.pwn"
#include "./includes/anti_bot.pwn"

/* SERVER CONFIGURATION */
#include "./includes/svrconfig.pwn"

/* SERVER MAIN FILES */
#include "./includes/commands.pwn"
#include "./includes/defvarenu.pwn"
#include "./includes/discord.pwn"
#include "./includes/functions.pwn"
//#include "./includes/mapswitch.pwn"
#include "./includes/textdraws.pwn"

main( ) { }

public OnPlayerRequestDownload(playerid, type, crc)
{
	if(!IsPlayerConnected(playerid)) return false;
    new filename[64], filefound, final_url[256];
                
    if(type == DOWNLOAD_REQUEST_TEXTURE_FILE) filefound = FindTextureFileNameFromCRC(crc, filename, sizeof(filename));
    else if(type == DOWNLOAD_REQUEST_MODEL_FILE) filefound = FindModelFileNameFromCRC(crc, filename, sizeof(filename));    
	if(filefound)
	{
		format(final_url, sizeof(final_url), "%s/%s", SERVER_DOWNLOAD, filename);
		RedirectDownload(playerid, final_url);
	}
	return true;
}

public OnPlayerFinishedDownloading(playerid, virtualworld)
{
	SendSuccessMessage(playerid, "You have successfully downloadeds custom models..");
    return true;
}

public OnGameModeInit()
{
	new MySQLOpt:reconnect = mysql_init_options();
	mysql_set_option(reconnect, AUTO_RECONNECT, true);
    
	g_Sql = mysql_connect_file("mysql.ini");
	
	print("[MySQL] Connecting to database server...");
	
	if( (!mysql_errno(g_Sql)) || (g_Sql != MYSQL_INVALID_HANDLE) ) print("[MySQL] Connection successful.");
	else printf("[MySQL] Could not connect to database server! Error number: %d", mysql_errno(g_Sql));
	
	mysql_log(ALL);
	AntiDeAMX();
	print("BSA Local: MySQL Connection was successful.");
	return true;
}

public OnGameModeExit()
{
	mysql_close(g_Sql);
	return true;
}

public OnPlayerConnect(playerid)
{
	new string[256], country[30];

	DefaultValues(playerid);
	CheckAccount(playerid);

	GetPlayerCountry(playerid, country, sizeof(country));
	format(string, sizeof(string), "Welcome to {3498db}Battlefield: San Andreas {FFFFFF}[Version "SVR_VERSION" | "SVR_WEBSITE"]");
	SendClientMessage(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "BSA Local: {FFFFFF}%s{AFAFAF} has joined the server. (Country: {FFFFFF}%s{AFAFAF})", GetName(playerid), country);
	SendClientMessageToAll(COLOR_GREY, string);

	PlayAudioStreamForPlayer(playerid, "https://iv.digital/videos/backup.mp3");

	CreateBSABackground(playerid);
	CreateLobby(playerid);
	return true;
}

public OnPlayerDisconnect(playerid, reason)
{
	new string[256];
	new szDisconnectReason[3][] =
    {
        "Timeout/Crash",
        "Quit",
        "Kick/Ban"
    };

	SavePlayerToDB(playerid);
	DefaultValues(playerid);
	KillTextdraws(playerid);

	format(string, sizeof(string), "BSA Local: {FFFFFF}%s{AFAFAF} has left the server. (Reason: %s)", GetName(playerid), szDisconnectReason[reason]);
	SendClientMessageToAll(COLOR_GREY, string);
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

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    if(playertextid == BSA_Lobby[3])
    {
         SendClientMessage(playerid, 0xFFFFFFAA, "You clicked on a textdraw.");
         CancelSelectTextDraw(playerid);
         return true;
    }
    return false;
}

public OnPlayerText(playerid, text[])
{
	new msg[256];
	if(InLobby[playerid])
	{
		format(msg, sizeof(msg), "[Lobby]{FFFFFF} %s: %s", GetName(playerid), text);
		SendClientMessageToAll(COLOR_LIGHTRED, msg);
	}
	else
	{
		SendErrorMessage(playerid, "You have not logged in yet!");
	}
	return false;
}

public OnQueryError(errorid, const error[], const callback[], const query[], MySQL:handle)
{
	switch(errorid)
	{
		case CR_SERVER_GONE_ERROR:
		{
			printf("Lost connection to server");
		}
		case ER_SYNTAX_ERROR:
		{
			printf("Something is wrong in your syntax, query: %s",query);
		}
	}
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
		mysql_format(g_Sql, query, sizeof(query), "SELECT `Password` FROM `players` WHERE `Username` = '%e'", GetName(playerid));
		mysql_query(g_Sql, query);
		cache_get_value_name(0, "Password", Password, BCRYPT_HASH_LENGTH);
		bcrypt_check(inputtext, Password, "OnPasswordChecked", "d", playerid);
	}
	else
		Kick(playerid);
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

/*public DCC_OnChannelMessage(DCC_Channel:channel, DCC_User:author, const message[])
{
	new samp[100 + 1];
	if(!DCC_GetChannelName(channel, samp))
		return 0; // invalid channel

	new user_name[32 + 1];
	if (!DCC_GetUserName(author, user_name))
		return 0; // invalid user

	new str[145];
	format(str, sizeof str, "[Discord/%s] %s: %s", samp, user_name, message);
	SendClientMessageToAll(-1, str);
	return 1;
}*/

CMD:discord(playerid, params[])
{
	if(!LoggedIn[playerid]) return true;
	if(isnull(params)) return SendUsageMessage(playerid, "/discord [message]");

	new string[128];
    format(string, sizeof(string), "[Discord]{FFFFFF} << %s: %s", GetName(playerid), params);
    SendClientMessageToAll(COLOR_DISCORD, string);

    if(_:logchannel == 0) logchannel = DCC_FindChannelById("558483417189056557");
	format(string, sizeof(string), "[SA-MP | In Game] %s: %s", GetName(playerid), params);
	DCC_SendChannelMessage(logchannel, string);
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