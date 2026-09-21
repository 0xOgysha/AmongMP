#if defined _AMONGMP_GAME_STATE_INCLUDED
    #endinput
#endif
#define _AMONGMP_GAME_STATE_INCLUDED

static g_GameState = GAME_STATE_BOOTING;

stock GameState_Set(state)
{
    g_GameState = state;
    return 1;
}

stock GameState_Get()
{
    return g_GameState;
}
