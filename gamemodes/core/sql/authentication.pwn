#include <YSI_Coding\y_hooks>

static
    Statement:Statement_Insert_Player,
    Statement:Statement_Load_Player;

hook OnGameModeInit(){
    static const SQL_Insert_Query[] = "\
        INSERT INTO \
        users(\
            user_name, \
            user_discord_id, \
            user_password, \
            user_ip\
        ) \
        VALUES(?, ?, ?, ?); \
        \
        INSERT INTO \
        stats(\
            stat_level, \
            stat_exp, \
            stat_hunger, \
            stat_thirst, \
            stat_health, \
            stat_armor, \
            stat_stamina, \
            stat_strength, \
            stat_speed, \
            stat_weapon_skill\
        ) \
        VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?); \
        \
        INSERT INTO \
        class(\
            class_position_x, \
            class_position_y, \
            class_position_z, \
            class_position_a, \
            class_position_interior, \
            class_position_world, \
            class_class, \
            class_nationality, \
            class_gender, \
            class_age, \
            class_accent\
        ) \
        VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); \
        \
        INSERT INTO \
        inventory(\
            inv_cash, \
            inv_counterfeit_cash, \
            inv_medkit, \
            inv_bandage\
        ) \
        VALUES(?, ?, ?, ?); \
    ";
    Statement_Insert_Player = MySQL_PrepareStatement(SQL_Handle, SQL_Insert_Query);

    static const SQL_Load_Query[] = "\
        SELECT \
        u.user_id, \
        u.user_name, \
        u.user_discord_id, \
        u.user_password, \
        u.user_ip, \
        s.stat_level, \
        s.stat_exp, \
        s.stat_hunger, \
        s.stat_thirst, \
        s.stat_health, \
        s.stat_armor, \
        s.stat_stamina, \
        s.stat_strength, \
        s.stat_speed, \
        s.stat_weapon_skill, \
        c.class_position_x, \
        c.class_position_y, \
        c.class_position_z, \
        c.class_position_a, \
        c.class_position_interior, \
        c.class_position_world, \
        c.class_class, \
        c.class_nationality, \
        c.class_gender, \
        c.class_age, \
        c.class_accent, \
        i.inv_cash, \
        i.inv_counterfeit_cash, \
        i.inv_medkit, \
        i.inv_bandage \
        \
        FROM users as u \
        LEFT JOIN stats as s \
        ON u.user_id=s.user_id \
        INNER JOIN class as c \
        ON s.user_id=c.user_id \
        INNER JOIN inventory as i \
        ON c.user_id=i.user_id \
        \
        WHERE u.user_name=?; \
    ";
    Statement_Load_Player = MySQL_PrepareStatement(SQL_Handle, SQL_Load_Query);
    return 1;
}

hook OnPlayerConnect(playerid){
    inline OnPlayerRowCheck(){
        MySQL_BindResult(Statement_Load_Player, 3, string);
        if(MySQL_Statement_FetchRow(Statement_Load_Player)){
            Player_Show_Login(playerid);
        }
        else{
            Player_Show_Register(playerid);
        }
        Player_Show_Login(playerid);
    }
    MySQL_Bind(Statement_Load_Player, 0, GetPlayerNameEx(playerid));
    MySQL_ExecuteThreaded_Inline(Statement_Load_Player, using inline OnPlayerRowCheck);
    CreatePlayer(playerid);
    return 1;
}

Player_Show_Login(playerid){
    inline OnPlayerRowCheck(){
        static string[60] = "None";
        MySQL_BindResult(Statement_Load_Player, 3, string);
        strcat(string, SERVER_SALT);
    }
    MySQL_ExecuteThreaded_Inline(Statement_Load_Player, using inline OnPlayerRowCheck);
}

Player_Show_Register(playerid){return playerid;}


CreatePlayer(playerid){
    // [users] table
    MySQL_Bind(Statement_Insert_Player, 0, GetPlayerNameEx(playerid));
    MySQL_Bind(Statement_Insert_Player, 1, Player_Discord_ID[playerid]);
    MySQL_Bind(Statement_Insert_Player, 2, Player_Password[playerid]);
    MySQL_Bind(Statement_Insert_Player, 3, Player_IP[playerid]);
    // [stats] table
    MySQL_BindInt(Statement_Insert_Player, 4, Player_Level[playerid]);
    MySQL_BindInt(Statement_Insert_Player, 5, Player_EXP[playerid]);
    MySQL_BindFloat(Statement_Insert_Player, 6, Player_Hunger[playerid]);
    MySQL_BindFloat(Statement_Insert_Player, 7, Player_Thirst[playerid]);
    MySQL_BindFloat(Statement_Insert_Player, 8, Player_Health[playerid]);
    MySQL_BindFloat(Statement_Insert_Player, 9, Player_Armor[playerid]);
    MySQL_BindFloat(Statement_Insert_Player, 10, Player_Stamina[playerid]);
    MySQL_BindFloat(Statement_Insert_Player, 11, Player_Strength[playerid]);
    MySQL_BindFloat(Statement_Insert_Player, 12, Player_Speed[playerid]);
    MySQL_BindFloat(Statement_Insert_Player, 13, Player_Weapon_Skill[playerid]);
    // [class] table
    MySQL_BindFloat(Statement_Insert_Player, 14, Player_Position_X[playerid]);
    MySQL_BindFloat(Statement_Insert_Player, 15, Player_Position_Y[playerid]);
    MySQL_BindFloat(Statement_Insert_Player, 16, Player_Position_Z[playerid]);
    MySQL_BindFloat(Statement_Insert_Player, 17, Player_Position_A[playerid]);
    MySQL_BindInt(Statement_Insert_Player, 18, Player_Position_Interior[playerid]);
    MySQL_BindInt(Statement_Insert_Player, 19, Player_Position_World[playerid]);
    MySQL_Bind(Statement_Insert_Player, 20, Player_Class[playerid]);
    MySQL_Bind(Statement_Insert_Player, 21, Player_Nationality[playerid]);
    MySQL_Bind(Statement_Insert_Player, 22, Player_Gender[playerid]);
    MySQL_BindInt(Statement_Insert_Player, 23, Player_Age[playerid]);
    MySQL_Bind(Statement_Insert_Player, 24, Player_Accent[playerid]);
    // [inventory] table
    MySQL_BindInt(Statement_Insert_Player, 25, Player_Cash[playerid]);
    MySQL_BindInt(Statement_Insert_Player, 26, Player_Counterfeit_Cash[playerid]);
    MySQL_BindInt(Statement_Insert_Player, 27, Player_Medkit[playerid]);
    MySQL_BindInt(Statement_Insert_Player, 28, Player_Bandage[playerid]);
    MySQL_ExecuteThreaded(Statement_Insert_Player);
    MySQL_StatementClose(Statement_Insert_Player);
}

GetPlayerNameEx(playerid){
    new PlayerName[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, PlayerName, MAX_PLAYER_NAME + 1);
    return PlayerName;
}