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
    SetGameModeText("AmongMP");
    GameState_Set(GAME_STATE_BOOTING);

    if (!Database_Connect())
    {
        print("[AmongMP] Database connection could not be started.");
        SendRconCommand("exit");
        return 0;
    }

    GameState_Set(GAME_STATE_WAITING);
    return 1;
}

public OnGameModeExit()
{
    Database_Disconnect();
    return 1;
}
