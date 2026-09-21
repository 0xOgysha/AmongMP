#include <open.mp>
#include <a_mysql>

#include "../src/core/constants.inc"
#include "../src/core/enums.inc"
#include "../src/core/game_state.inc"
#include "../src/database/database.inc"

main()
{
    print("----------------------------------");
    print(" AmongMP - open.mp social deduction");
    print("----------------------------------");
}

public OnGameModeInit()
{
    SetGameModeText("AmongMP Test");
    AddPlayerClass(0, TEST_SPAWN_X, TEST_SPAWN_Y, TEST_SPAWN_Z, TEST_SPAWN_A, 0, 0, 0, 0, 0, 0);
    GameState_Set(GAME_STATE_BOOTING);

    if (!Database_Connect())
    {
        print("[AmongMP] Database connection failed. Check mysql.ini and MySQL.");
        return 1;
    }

    GameState_Set(GAME_STATE_WAITING);
    print("[AmongMP] Test milestone ready.");
    return 1;
}

public OnGameModeExit()
{
    Database_Disconnect();
    return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid, 0xA9C4E4FF, "AmongMP test server: connected.");
    SendClientMessage(playerid, 0xFFFFFFFF, "Use /serverinfo or /dbtest.");
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    SetPlayerPos(playerid, TEST_SPAWN_X, TEST_SPAWN_Y, TEST_SPAWN_Z);
    SetPlayerCameraPos(playerid, 1471.0, -1760.0, 24.0);
    SetPlayerCameraLookAt(playerid, TEST_SPAWN_X, TEST_SPAWN_Y, TEST_SPAWN_Z);
    return 1;
}

public OnPlayerSpawn(playerid)
{
    SetPlayerPos(playerid, TEST_SPAWN_X, TEST_SPAWN_Y, TEST_SPAWN_Z);
    SetPlayerFacingAngle(playerid, TEST_SPAWN_A);
    SetCameraBehindPlayer(playerid);
    SendClientMessage(playerid, 0x7CFC00FF, "AmongMP: test spawn loaded successfully.");
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if (!strcmp(cmdtext, "/serverinfo", true))
    {
        new message[96];
        format(message, sizeof message, "AmongMP %s | open.mp | BlueG MySQL R41-4", AMONGMP_VERSION);
        SendClientMessage(playerid, 0xFFFFFFFF, message);
        return 1;
    }

    if (!strcmp(cmdtext, "/dbtest", true))
    {
        if (Database_GetHandle() == MYSQL_INVALID_HANDLE || mysql_errno(Database_GetHandle()) != 0)
            SendClientMessage(playerid, 0xFF6347FF, "MySQL: connection is NOT available.");
        else
            SendClientMessage(playerid, 0x7CFC00FF, "MySQL: connection is available.");
        return 1;
    }
    return 0;
}
