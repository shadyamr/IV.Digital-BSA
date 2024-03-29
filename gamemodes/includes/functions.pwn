#include <YSI\y_hooks>

// PUBLIC FUNCTIONS:
Function:SaveSQLInt(sqlid, table[], row[], value)
{
	new query[512];
	mysql_format(g_Sql, query, sizeof(query), "UPDATE %e SET %e = %i WHERE ID = %i", table, row, value, sqlid);
	mysql_tquery(g_Sql, query);
	return true;
}

Function:SaveSQLFloat(sqlid, table[], row[], Float:value)
{
	new query[512];
	mysql_format(g_Sql, query, sizeof(query), "UPDATE %e SET %e = %f WHERE ID = %i", table, row, value, sqlid);
	mysql_tquery(g_Sql, query);
	return true;
}

Function:SaveSQLString(sqlid, table[], row[], value[])
{
	new query[512];
	mysql_format(g_Sql, query, sizeof(query), "UPDATE %e SET %e = %s WHERE ID = %i", table, row, value, sqlid);
	mysql_tquery(g_Sql, query);
	return true;
}

Function:CheckAccount(playerid)
{
	new query[256];
	mysql_format(g_Sql, query, sizeof(query), "SELECT * FROM `players` WHERE `Username` = '%e' LIMIT 1", GetName(playerid));
	mysql_tquery(g_Sql, query, "SQL_CheckAccount", "d", playerid);
	return true;
}

Function:SQL_CheckAccount(playerid)
{
	ShowBSABackground(playerid);
	if(cache_num_rows())
	{
		ShowLoginDialog(playerid, "");
	}
	else
	{
		ShowRegisterDialog(playerid, "");		
	}
	return true;
}

Function:ShowLoginDialog(playerid, error[])
{
	if(!strmatch(error, ""))
	{
		SendClientMessage(playerid, COLOR_RED, error);
	}
	new string[256];
	format(string, sizeof(string), "{FFFFFF}Welcome back, %s.\n\nPlease input your password below to login.", GetName(playerid));
	Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Battlefield: San Andreas", string, "Login", "Leave");
	return true;
}

Function:ShowRegisterDialog(playerid, error[])
{
	if(!strmatch(error, ""))
	{
		SendClientMessage(playerid, COLOR_RED, error);
	}
	new string[256];
	format(string, sizeof(string), "{FFFFFF}Welcome, %s.\n\nPlease input a strong password below to register.", GetName(playerid));
	Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Battlefield: San Andreas", string, "Register", "Leave");
	return true;
}

Function:OnPasswordHashed(playerid)
{
	new hash[BCRYPT_HASH_LENGTH], query[300], string[256], year, month, day;
	bcrypt_get_hash(hash);
	getdate(year, month, day);
    format(PlayerInfo[playerid][user_regdate], 16, "%02d/%02d/%d", day, month, year);
	
	format(string, sizeof(string), "[SERVER]:{FFFFFF} You have successfully registered to the server as {3498db}%s{FFFFFF}, your account information is now being saved.", GetName(playerid));
	SendClientMessage(playerid, COLOR_IVDIGITAL, string);

	mysql_format(g_Sql, query, sizeof(query), "INSERT INTO `players` (`Username`, `Password`, `IPAddress`, `RegDate`) VALUES ('%e', '%e', '%e', '%e')", GetName(playerid), hash, ReturnIP(playerid), PlayerInfo[playerid][user_regdate]);
	mysql_tquery(g_Sql, query, "OnPlayerRegister", "d", playerid);
	return true;
}

Function:OnPlayerRegister(playerid)
{
	SetPlayerSpawn(playerid);
	SendClientMessage(playerid, COLOR_IVDIGITAL, "[SERVER]:{FFFFFF} Welcome to Battlefield: San Andreas, enjoy your stay!");
	return true;	
}

Function:OnPasswordChecked(playerid)
{
	new bool:match = bcrypt_is_equal();
	if(match)
	{
		new query[300], string[256];
		format(string, sizeof(string), "[SERVER]:{FFFFFF} You have successfully logged in as {3498db}%s{FFFFFF}, your account information is now being loaded.", GetName(playerid));
		SendClientMessage(playerid, COLOR_IVDIGITAL, string);
		mysql_format(g_Sql, query, sizeof(query), "SELECT * FROM `players` WHERE `Username` = '%e'", GetName(playerid));
		mysql_tquery(g_Sql, query, "OnPlayerLoad", "d", playerid);
	}
	else
	{
		ShowLoginDialog(playerid, "[ERROR]:{FFFFFF} You have entered an incorrect password.");
		LoginChance[playerid]++;
		if(LoginChance[playerid] == 3)
		{
			SendServerMessage(playerid, "You have been kicked for bad password attempts.");
			return KickEx(playerid);
		}
	}
	return true;
}

Function:OnPlayerLoad(playerid)
{
	cache_get_value_name(0, "RegDate", PlayerInfo[playerid][user_regdate], 16);
	cache_get_value_name_int(0, "ID", PlayerInfo[playerid][user_id]);
	cache_get_value_name_int(0, "Cash", PlayerInfo[playerid][user_cash]);
	cache_get_value_name_int(0, "Kills", PlayerInfo[playerid][user_kills]);
	cache_get_value_name_int(0, "Deaths", PlayerInfo[playerid][user_deaths]);
	cache_get_value_name_int(0, "AdminLevel", PlayerInfo[playerid][user_admin]);
	cache_get_value_name_int(0, "AccessLevel", PlayerInfo[playerid][user_accesslvl]);

	LoggedIn[playerid] = true;
	SendClientMessage(playerid, COLOR_IVDIGITAL, "[SERVER]:{FFFFFF} Welcome back to our server! Your last login was {3498db}0 days and 0 hours ago {FFFFFF}({3498db}/logins{FFFFFF}).");
	SetPlayerSpawn(playerid);
	return true;
}

Function:DefaultValues(playerid)
{
	LoginChance[playerid] = 0;
	InLobby[playerid] = false;
	PlayerInfo[playerid][user_id] = 0;
	PlayerInfo[playerid][user_cash] = 0;
	PlayerInfo[playerid][user_kills] = 0;
	PlayerInfo[playerid][user_deaths] = 0;
	PlayerInfo[playerid][user_admin] = 0;
	PlayerInfo[playerid][user_accesslvl] = 0;
	return true;
}

Function:SetPlayerSpawn(playerid)
{
	StopAudioStreamForPlayer(playerid);
	ShowLobby(playerid);
	DeleteBSABackground(playerid);
	SetSpawnInfo(playerid, 1, 0, -2384.9851, -555.0211, 129.1375, 161.9820, 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	SetPlayerVirtualWorld(playerid, 200+playerid);
	SetPlayerCameraPos(playerid, -2386.2234,-558.7192,130.6172);
	SetPlayerCameraLookAt(playerid, -2384.0381,-552.0007,129.0110);	
	TogglePlayerControllable(playerid, false);
	return true;
}

Function:OnPasswordChanged(playerid)
{
	new hash[BCRYPT_HASH_LENGTH], query[300];
	bcrypt_get_hash(hash);
	mysql_format(g_Sql, query, sizeof(query), "UPDATE `players` SET `Password` = '%e' WHERE `Username` = '%e' LIMIT 1", hash, GetName(playerid));
	mysql_query(g_Sql, query);
	SendClientMessage(playerid, -1, "You have successfully changed your password.");
	return true;
}

Function:KickPlayer(playerid)
{
	Kick(playerid);
}

Function:SavePlayerToDB(playerid)
{
	new query[256];
	mysql_format(g_Sql, query, sizeof(query), "UPDATE `players` SET `Cash` = '%i', `Kills` = '%i', `Deaths` = '%i', `AdminLevel` = '%i', `AccessLevel` = '%i' WHERE `ID` = '%i' LIMIT 1",
		PlayerInfo[playerid][user_cash],
		PlayerInfo[playerid][user_kills],
		PlayerInfo[playerid][user_deaths],
		PlayerInfo[playerid][user_admin],
		PlayerInfo[playerid][user_accesslvl],
		PlayerInfo[playerid][user_id]);
	mysql_query(g_Sql, query);
	return true;
}

// STOCK FUNCTIONS:
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

GetDate()
{
	new sendString[90], MonthStr[40], month, day, year;
	new hour, minute, second;

	gettime(hour, minute, second);
	getdate(year, month, day);
	switch(month)
	{
	    case 1:  MonthStr = "January";
	    case 2:  MonthStr = "February";
	    case 3:  MonthStr = "March";
	    case 4:  MonthStr = "April";
	    case 5:  MonthStr = "May";
	    case 6:  MonthStr = "June";
	    case 7:  MonthStr = "July";
	    case 8:  MonthStr = "August";
	    case 9:  MonthStr = "September";
	    case 10: MonthStr = "October";
	    case 11: MonthStr = "November";
	    case 12: MonthStr = "December";
	}

	format(sendString, 90, "%s %d, %d %02d:%02d:%02d", MonthStr, day, year, hour, minute, second);
	return sendString;
}

strmatch(const String1[], const String2[])
{
    if ((strcmp(String1, String2, true, strlen(String2)) == 0) && (strlen(String2) == strlen(String1)))
    {
        return true;
    }
    else
    {
        return false;
    }
}

KickEx(playerid)
{
	SetTimerEx("KickPlayer", 500, false, "i", playerid);
	return true;
}

