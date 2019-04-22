#include <YSI\y_hooks>

new MapChange;

hook OnScriptInit()
{
    SetTimer("NewMapTimer",180000,true);
    MapChange = 0;  
    return true;
}

Function:OnPlayerSpawnInMap(playerid)
{
    switch(MapChange)
    {
        case 0:
        {
            // COORDS
        }
        case 1:
        {
            // COORDS
        }
        case 2:
        {
            // COORDS
        }
    }
    return true;
}

Function:NewMapTimer(playerid)
{
    MapChange++;
    GameTextForAll("~b~ Loading new ~w~MAP", 4000, 3);
    SetTimer("NewRound", 4000, false);
    return true;
}

Function:NewRound()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        switch(MapChange)
        {
            case 0:
            {
                // MESSAGE [i]
            }
            case 1:
            {
                // MESSAGE [i]
            }
            case 2:
            {
                // MESSAGE [i]
            }
        }
    }
    return true;
}