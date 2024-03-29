#include <YSI\y_hooks>
static const BOT_ATTACK_BLOCK_TIME = 120000; // 2 minutes

static stock botattack_ServerInitTS = 0;
static stock botattack_LastConnection = 0;
static stock botattack_ConnectionSpamCount = 0;

hook OnScriptInit()
{
	botattack_ServerInitTS = gettime();
	return true;
}

hook OnIncomingConnection(playerid, ip_address[ ], port)
{
	if(!(0 <= playerid < MAX_PLAYERS))
    {
		BlockIpAddress(ip_address, BOT_ATTACK_BLOCK_TIME);
	}

	new current_time = gettime();
	if(current_time - botattack_ServerInitTS >= 300)
	{
		if(current_time - botattack_LastConnection <= 2)
		{
			if(++ botattack_ConnectionSpamCount >= 5)
			{
				BlockIpAddress(ip_address, BOT_ATTACK_BLOCK_TIME);
				return true;
			}
		}
		else
		{
			botattack_ConnectionSpamCount = 0;
		}

		botattack_LastConnection = current_time;
	}
	return true;
}