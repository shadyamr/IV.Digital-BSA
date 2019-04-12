#include <YSI\y_hooks>

/* SERVER CONFIGURATION */
new SERVER_DOWNLOAD[] = "http://cdn.iv.digital/samp/models";
#define 	SVR_NAME		"[IV.Digital] Battlefield: San Andreas (0.3.DL)"
#define 	SVR_RCON		"ShadyBigBoss"
#define 	SVR_GMTEXT		"B:SA "SVR_VERSION""
#define 	SVR_VERSION		"0.1.1y" 		/*	z - minor bug fixes || y - small updates/new features || x - big new features */
#define 	SVR_WEBSITE		"iv.digital"
#define 	SVR_LOCATION	"San Andreas"
#define 	SVR_LANGUAGE	"English"
#define 	SVR_PASSWORD	"a7a" 		// USED DURING BETA PHASE OR MAINTENANCE.

/* BCRYPT COST */
#define	    BCRYPT_COST	    12

/* GAMEMODE INITIALIZE*/
hook OnScriptInit()
{
    SendRconCommand("hostname "SVR_NAME"");
    SendRconCommand("rcon_password "SVR_RCON"");
    SendRconCommand("weburl "SVR_WEBSITE"");
    SendRconCommand("mapname "SVR_LOCATION"");
    SendRconCommand("language "SVR_LANGUAGE"");
    SendRconCommand("password "SVR_PASSWORD"");
	SetGameModeText(SVR_GMTEXT);

	EnableStuntBonusForAll(0);
	DisableInteriorEnterExits();
	UsePlayerPedAnims();
    AllowInteriorWeapons(0);
    return true;
}