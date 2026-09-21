#if defined _AMONGMP_DATABASE_INCLUDED
    #endinput
#endif
#define _AMONGMP_DATABASE_INCLUDED

static MySQL:g_SQL = MYSQL_INVALID_HANDLE;

stock bool:Database_Connect()
{
    g_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE);

    if (g_SQL == MYSQL_INVALID_HANDLE || mysql_errno(g_SQL) != 0)
    {
        printf("[MySQL] Connection failed. Error: %d", mysql_errno(g_SQL));
        return false;
    }

    print("[MySQL] Connected successfully.");
    return true;
}

stock Database_Disconnect()
{
    if (g_SQL != MYSQL_INVALID_HANDLE)
    {
        mysql_close(g_SQL);
        g_SQL = MYSQL_INVALID_HANDLE;
    }
    return 1;
}

stock MySQL:Database_GetHandle()
{
    return g_SQL;
}
