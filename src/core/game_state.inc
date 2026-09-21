#if defined _AMONGMP_GAME_STATE_INCLUDED
    #endinput
#endif
#define _AMONGMP_GAME_STATE_INCLUDED

static g_GameState = _:GAME_STATE_BOOTING;

stock GameState_Set(E_GAME_STATE:state)
{
    g_GameState = _:state;
    return 1;
}

stock E_GAME_STATE:GameState_Get()
{
    return E_GAME_STATE:g_GameState;
}
