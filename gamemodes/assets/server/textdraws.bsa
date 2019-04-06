#include <YSI\y_hooks>
new PlayerText:BSALogin_BG, PlayerText:BSA_Lobby[30];

Function:CreateBSABackground(playerid)
{
    BSALogin_BG = CreatePlayerTextDraw(playerid, -1.120005, -0.166680, "mdl-2000:bsabg");
    PlayerTextDrawLetterSize(playerid, BSALogin_BG, 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, BSALogin_BG, 674.000000, 482.000000);
    PlayerTextDrawAlignment(playerid, BSALogin_BG, 1);
    PlayerTextDrawColor(playerid, BSALogin_BG, -1);
    PlayerTextDrawSetShadow(playerid, BSALogin_BG, 0);
    PlayerTextDrawSetOutline(playerid, BSALogin_BG, 0);
    PlayerTextDrawBackgroundColor(playerid, BSALogin_BG, 255);
    PlayerTextDrawFont(playerid, BSALogin_BG, 4);
    PlayerTextDrawSetProportional(playerid, BSALogin_BG, 0);
    PlayerTextDrawSetShadow(playerid, BSALogin_BG, 0);
    return true;
}

Function:ShowBSABackground(playerid)
{
    PlayerTextDrawShow(playerid, BSALogin_BG);
    return true;
}

Function:DeleteBSABackground(playerid)
{
    PlayerTextDrawHide(playerid, BSALogin_BG);
    return true;
}

Function:CreateLobby(playerid)
{
    SelectTextDraw(playerid, 0xECF0F1FF);
	BSA_Lobby[0] = CreatePlayerTextDraw(playerid, -7.000000, -4.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[0], 694.000000, 43.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[0], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[0], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[0], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[0], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[0], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[0], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[0], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[0], 0);

	BSA_Lobby[1] = CreatePlayerTextDraw(playerid, 14.000000, 2.999999, "mdl-2001:bsa");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[1], 92.000000, 34.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[1], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[1], -1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[1], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[1], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[1], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[1], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[1], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[1], 0);

	new tdstr[25];
	format(tdstr, sizeof tdstr, "%s", GetName(playerid));
	BSA_Lobby[2] = CreatePlayerTextDraw(playerid, 12.000000, 93.000000, "Name");
	PlayerTextDrawSetString(playerid, BSA_Lobby[2], tdstr);
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[2], 0.272561, 1.512498);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[2], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[2], -1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[2], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[2], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[2], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[2], 2);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[2], 1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[2], 0);

	BSA_Lobby[3] = CreatePlayerTextDraw(playerid, 143.200744, 14.000000, "Home");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[3], 0.272561, 1.512498);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[3], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[3], -1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[3], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[3], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[3], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[3], 2);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[3], 1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[3], 0);
	PlayerTextDrawSetSelectable(playerid, BSA_Lobby[3], true);

	BSA_Lobby[4] = CreatePlayerTextDraw(playerid, 196.403991, 14.000000, "Profile");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[4], 0.272561, 1.512498);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[4], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[4], -1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[4], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[4], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[4], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[4], 2);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[4], 1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[4], 0);
	PlayerTextDrawSetSelectable(playerid, BSA_Lobby[4], true);

	BSA_Lobby[5] = CreatePlayerTextDraw(playerid, 264.108123, 14.000000, "Leaderboards");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[5], 0.272561, 1.512498);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[5], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[5], -1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[5], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[5], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[5], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[5], 2);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[5], 1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[5], 0);
	PlayerTextDrawSetSelectable(playerid, BSA_Lobby[5], true);

	BSA_Lobby[6] = CreatePlayerTextDraw(playerid, 8.000000, 288.000000, "LD_spac:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[6], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[6], 132.000000, -172.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[6], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[6], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[6], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[6], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[6], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[6], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[6], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[6], 0);
	PlayerTextDrawSetSelectable(playerid, BSA_Lobby[6], true);

	BSA_Lobby[7] = CreatePlayerTextDraw(playerid, 374.114837, 14.000000, "Armory");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[7], 0.272561, 1.512498);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[7], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[7], -1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[7], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[7], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[7], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[7], 2);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[7], 1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[7], 0);
	PlayerTextDrawSetSelectable(playerid, BSA_Lobby[7], true);

	BSA_Lobby[8] = CreatePlayerTextDraw(playerid, 8.000000, 88.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[8], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[8], 132.000000, 26.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[8], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[8], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[8], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[8], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[8], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[8], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[8], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[8], 0);

	BSA_Lobby[9] = CreatePlayerTextDraw(playerid, -7.000000, 118.000000, "");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[9], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[9], 61.000000, 58.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[9], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[9], -1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[9], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[9], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[9], 0);
	PlayerTextDrawFont(playerid, BSA_Lobby[9], 5);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[9], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[9], 0);
	PlayerTextDrawSetPreviewModel(playerid, BSA_Lobby[9], 285);
	PlayerTextDrawSetPreviewRot(playerid, BSA_Lobby[9], 0.000000, 0.000000, 0.000000, 0.899999);

	BSA_Lobby[10] = CreatePlayerTextDraw(playerid, 8.000000, 291.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[10], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[10], 131.720153, 25.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[10], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[10], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[10], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[10], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[10], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[10], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[10], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[10], 0);

	BSA_Lobby[11] = CreatePlayerTextDraw(playerid, 32.000000, 296.000000, "ASSIGNMENTS");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[11], 0.272561, 1.512498);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[11], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[11], -1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[11], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[11], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[11], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[11], 2);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[11], 1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[11], 0);

	BSA_Lobby[12] = CreatePlayerTextDraw(playerid, 45.000000, 120.000000, "Colonel");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[12], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[12], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[12], -1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[12], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[12], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[12], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[12], 2);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[12], 1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[12], 0);

	BSA_Lobby[13] = CreatePlayerTextDraw(playerid, 577.000000, 379.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[13], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[13], 59.000000, 28.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[13], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[13], 882433023);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[13], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[13], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[13], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[13], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[13], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[13], 0);

	BSA_Lobby[14] = CreatePlayerTextDraw(playerid, 584.000000, 386.000000, "Play!");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[14], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[14], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[14], -1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[14], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[14], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[14], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[14], 2);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[14], 1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[14], 0);
	PlayerTextDrawSetSelectable(playerid, BSA_Lobby[14], true);

	BSA_Lobby[15] = CreatePlayerTextDraw(playerid, 41.000000, 116.000000, "mdl-2002:rank_colonel");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[15], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[15], 84.000000, 77.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[15], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[15], -1);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[15], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[15], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[15], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[15], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[15], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[15], 0);

	BSA_Lobby[16] = CreatePlayerTextDraw(playerid, 8.000000, 181.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[16], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[16], 132.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[16], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[16], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[16], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[16], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[16], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[16], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[16], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[16], 0);

	BSA_Lobby[17] = CreatePlayerTextDraw(playerid, 8.000000, 288.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[17], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[17], 132.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[17], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[17], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[17], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[17], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[17], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[17], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[17], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[17], 0);

	BSA_Lobby[18] = CreatePlayerTextDraw(playerid, 8.000000, 292.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[18], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[18], 132.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[18], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[18], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[18], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[18], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[18], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[18], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[18], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[18], 0);

	BSA_Lobby[19] = CreatePlayerTextDraw(playerid, 8.000000, 316.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[19], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[19], 132.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[19], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[19], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[19], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[19], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[19], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[19], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[19], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[19], 0);

	BSA_Lobby[20] = CreatePlayerTextDraw(playerid, 140.000000, 88.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[20], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[20], -1.000000, 26.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[20], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[20], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[20], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[20], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[20], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[20], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[20], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[20], 0);

	BSA_Lobby[21] = CreatePlayerTextDraw(playerid, 140.000000, 116.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[21], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[21], -1.000000, 171.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[21], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[21], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[21], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[21], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[21], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[21], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[21], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[21], 0);

	BSA_Lobby[22] = CreatePlayerTextDraw(playerid, 40.000000, 116.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[22], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[22], -1.000000, 64.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[22], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[22], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[22], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[22], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[22], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[22], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[22], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[22], 0);

	BSA_Lobby[23] = CreatePlayerTextDraw(playerid, 9.000000, 116.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[23], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[23], -1.000000, 171.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[23], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[23], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[23], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[23], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[23], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[23], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[23], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[23], 0);

	BSA_Lobby[24] = CreatePlayerTextDraw(playerid, 9.000000, 88.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[24], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[24], -1.000000, 26.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[24], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[24], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[24], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[24], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[24], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[24], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[24], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[24], 0);

	BSA_Lobby[25] = CreatePlayerTextDraw(playerid, 9.000000, 292.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[25], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[25], -1.000000, 24.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[25], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[25], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[25], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[25], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[25], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[25], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[25], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[25], 0);

	BSA_Lobby[26] = CreatePlayerTextDraw(playerid, 140.000000, 292.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[26], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[26], -1.000000, 23.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[26], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[26], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[26], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[26], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[26], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[26], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[26], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[26], 0);

	BSA_Lobby[27] = CreatePlayerTextDraw(playerid, 9.000000, 117.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[27], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[27], 131.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[27], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[27], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[27], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[27], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[27], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[27], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[27], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[27], 0);

	BSA_Lobby[28] = CreatePlayerTextDraw(playerid, 9.000000, 114.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[28], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[28], 131.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[28], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[28], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[28], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[28], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[28], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[28], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[28], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[28], 0);

	BSA_Lobby[29] = CreatePlayerTextDraw(playerid, 9.000000, 89.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, BSA_Lobby[29], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, BSA_Lobby[29], 131.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, BSA_Lobby[29], 1);
	PlayerTextDrawColor(playerid, BSA_Lobby[29], 200);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[29], 0);
	PlayerTextDrawSetOutline(playerid, BSA_Lobby[29], 0);
	PlayerTextDrawBackgroundColor(playerid, BSA_Lobby[29], 255);
	PlayerTextDrawFont(playerid, BSA_Lobby[29], 4);
	PlayerTextDrawSetProportional(playerid, BSA_Lobby[29], 0);
	PlayerTextDrawSetShadow(playerid, BSA_Lobby[29], 0);
    return true;
}

Function:ShowLobby(playerid)
{
    InLobby[playerid] = true;
	PlayerTextDrawShow(playerid, BSA_Lobby[0]);
	PlayerTextDrawShow(playerid, BSA_Lobby[1]);
	PlayerTextDrawShow(playerid, BSA_Lobby[2]);
	PlayerTextDrawShow(playerid, BSA_Lobby[3]);
	PlayerTextDrawShow(playerid, BSA_Lobby[4]);
	PlayerTextDrawShow(playerid, BSA_Lobby[5]);
	PlayerTextDrawShow(playerid, BSA_Lobby[6]);
	PlayerTextDrawShow(playerid, BSA_Lobby[7]);
	PlayerTextDrawShow(playerid, BSA_Lobby[8]);
	PlayerTextDrawShow(playerid, BSA_Lobby[9]);
	PlayerTextDrawShow(playerid, BSA_Lobby[10]);
	PlayerTextDrawShow(playerid, BSA_Lobby[11]);
	PlayerTextDrawShow(playerid, BSA_Lobby[12]);
	PlayerTextDrawShow(playerid, BSA_Lobby[13]);
	PlayerTextDrawShow(playerid, BSA_Lobby[14]);
	PlayerTextDrawShow(playerid, BSA_Lobby[15]);
	PlayerTextDrawShow(playerid, BSA_Lobby[16]);
	PlayerTextDrawShow(playerid, BSA_Lobby[17]);
	PlayerTextDrawShow(playerid, BSA_Lobby[18]);
	PlayerTextDrawShow(playerid, BSA_Lobby[19]);
	PlayerTextDrawShow(playerid, BSA_Lobby[20]);
	PlayerTextDrawShow(playerid, BSA_Lobby[21]);
	PlayerTextDrawShow(playerid, BSA_Lobby[22]);
	PlayerTextDrawShow(playerid, BSA_Lobby[23]);
	PlayerTextDrawShow(playerid, BSA_Lobby[24]);
	PlayerTextDrawShow(playerid, BSA_Lobby[25]);
	PlayerTextDrawShow(playerid, BSA_Lobby[26]);
	PlayerTextDrawShow(playerid, BSA_Lobby[27]);
	PlayerTextDrawShow(playerid, BSA_Lobby[28]);
	PlayerTextDrawShow(playerid, BSA_Lobby[29]);
    return true;
}

Function:DeleteLobby(playerid)
{
	PlayerTextDrawHide(playerid, BSA_Lobby[0]);
	PlayerTextDrawHide(playerid, BSA_Lobby[1]);
	PlayerTextDrawHide(playerid, BSA_Lobby[2]);
	PlayerTextDrawHide(playerid, BSA_Lobby[3]);
	PlayerTextDrawHide(playerid, BSA_Lobby[4]);
	PlayerTextDrawHide(playerid, BSA_Lobby[5]);
	PlayerTextDrawHide(playerid, BSA_Lobby[6]);
	PlayerTextDrawHide(playerid, BSA_Lobby[7]);
	PlayerTextDrawHide(playerid, BSA_Lobby[8]);
	PlayerTextDrawHide(playerid, BSA_Lobby[9]);
	PlayerTextDrawHide(playerid, BSA_Lobby[10]);
	PlayerTextDrawHide(playerid, BSA_Lobby[11]);
	PlayerTextDrawHide(playerid, BSA_Lobby[12]);
	PlayerTextDrawHide(playerid, BSA_Lobby[13]);
	PlayerTextDrawHide(playerid, BSA_Lobby[14]);
	PlayerTextDrawHide(playerid, BSA_Lobby[15]);
	PlayerTextDrawHide(playerid, BSA_Lobby[16]);
	PlayerTextDrawHide(playerid, BSA_Lobby[17]);
	PlayerTextDrawHide(playerid, BSA_Lobby[18]);
	PlayerTextDrawHide(playerid, BSA_Lobby[19]);
	PlayerTextDrawHide(playerid, BSA_Lobby[20]);
	PlayerTextDrawHide(playerid, BSA_Lobby[21]);
	PlayerTextDrawHide(playerid, BSA_Lobby[22]);
	PlayerTextDrawHide(playerid, BSA_Lobby[23]);
	PlayerTextDrawHide(playerid, BSA_Lobby[24]);
	PlayerTextDrawHide(playerid, BSA_Lobby[25]);
	PlayerTextDrawHide(playerid, BSA_Lobby[26]);
	PlayerTextDrawHide(playerid, BSA_Lobby[27]);
	PlayerTextDrawHide(playerid, BSA_Lobby[28]);
	PlayerTextDrawHide(playerid, BSA_Lobby[29]);
	return true;
}

Function:KillTextdraws(playerid)
{
	PlayerTextDrawDestroy(playerid, BSALogin_BG);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[0]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[1]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[2]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[3]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[4]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[5]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[6]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[7]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[8]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[9]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[10]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[11]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[12]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[13]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[14]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[15]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[16]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[17]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[18]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[19]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[20]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[21]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[22]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[23]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[24]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[25]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[26]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[27]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[28]);
	PlayerTextDrawDestroy(playerid, BSA_Lobby[29]);
	return true;
}