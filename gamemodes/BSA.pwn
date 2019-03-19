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
#include <easyDialog>
#include <izcmd>
#include <sscanf2>
#include <streamer>

#include "../gamemodes/assets.colors.bsa"
#include "../gamemodes/assets/defvarenu.bsa"
#include "../gamemodes/assets/functions.bsa"
#include "../gamemodes/assets/mysql.bsa"

public OnGameModeInit()
{
	Database = mysql_connect(MYSQL_HOSTNAME, MYSQL_USERNAME, MYSQL_PASSWORD, MYSQL_DATABASE);
	if(Database == MYSQL_INVALID_HANDLE || mysql_errno(Database) != 0)
	{
		print("BSA Local: MySQL Connection failed, shutting the server down!");
		SendRconCommand("exit");
		return true;
	}

	SetGameModeText("BSA");
	mysql_log(ALL);
	print("BSA Local: MySQL Connection was successful.");
	return true;
}

public OnPlayerConnect(playerid)
{
	new query[200];
	mysql_format(Database, query, sizeof(query), "SELECT * FROM `players` WHERE `Username` = '%e'", GetName(playerid));
	mysql_tquery(Database, query, "CheckAccount", "d", playerid);
	return true;
}

public OnPlayerDisconnect(playerid, reason)
{
	new query[200];
	mysql_format(Database, query, sizeof(query), "UPDATE `players` SET `Cash` = '%i', `Kills` = '%i', `Deaths` = '%i' WHERE `ID` = '%i'", PlayerInfo[playerid][user_cash], PlayerInfo[playerid][user_kills], PlayerInfo[playerid][user_deaths], PlayerInfo[playerid][user_id]);
	mysql_query(Database, query);
	return true;
}

public OnPlayerSpawn(playerid)
{
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

Dialog:DIALOG_PASSWORDCHANGE(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		bcrypt_hash(inputtext, BCRYPT_COST, "OnPasswordChanged", "i", playerid);
	}
	return true;
}

GetName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	return name;
}

ReturnIP(playerid)
{
	new PlayerIP[17];
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	return PlayerIP;
}