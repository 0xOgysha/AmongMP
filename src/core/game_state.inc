#if defined _AMONGMP_GAME_STATE_INCLUDED
    #endinput
#endif
#define _AMONGMP_GAME_STATE_INCLUDED

static E_GAME_STATE:g_GameState = GAME_STATE_BOOTING;

stock GameState_Set(E_GAME_STATE:newState)
{
    g_GameState = newState;
    return 1;
}

stock E_GAME_STATE:GameState_Get()
{
    return g_GameState;
}
