#include <YSI\y_hooks>

new DCC_Channel:logchannel, dstr[512];

hook OnScriptInit()
{
	if(_:logchannel == 0) logchannel = DCC_FindChannelById("557714574883684353");
    format(dstr, sizeof(dstr), "BSA Local: Server has been started. (%s)", GetDate());
	DCC_SendChannelMessage(logchannel, dstr);
	return true;
}

hook OnGameModeExit()
{
    if(_:logchannel == 0) logchannel = DCC_FindChannelById("557714574883684353");
    format(dstr, sizeof(dstr), "BSA Local: Server has been shutted down. (%s)", GetDate());
	DCC_SendChannelMessage(logchannel, dstr);
    return true;
}

hook OnPlayerConnect(playerid)
{
    if(_:logchannel == 0) logchannel = DCC_FindChannelById("557714574883684353");
	format(dstr, sizeof(dstr), "BSA Local: %s has joined the server (IP: %s || %s)", GetName(playerid), ReturnIP(playerid), GetDate());
	DCC_SendChannelMessage(logchannel, dstr);
    return true;
}

hook OnPlayerDisconnect(playerid, reason)
{
    new userip[16], szDisconnectReason[3][] =
    {
        "Timeout/Crash",
        "Quit",
        "Kick/Ban"
    };

    GetPlayerIp(playerid, userip, sizeof(userip));

    if(_:logchannel == 0) logchannel = DCC_FindChannelById("557714574883684353");
	format(dstr, sizeof(dstr), "BSA Local: %s has left the server (Reason: %s || %s)", GetName(playerid), szDisconnectReason[reason], userip, GetDate());
	DCC_SendChannelMessage(logchannel, dstr);
}

/*Function:OnDiscordRestart()
{
	if(_:logchannel == 0) logchannel = DCC_FindChannelById("557714574883684353");
    format(dstr, sizeof(dstr), "BSA Local: Server has been restarted. (%s)", GetDate());
	DCC_SendChannelMessage(logchannel, dstr);
    return true;
}*/