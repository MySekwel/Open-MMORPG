#include <YSI_Coding\y_hooks>

static
    Statement:InsertPlayer,
    Statement:LoadPlayer;

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
    InsertPlayer = MySQL_PrepareStatement(SQL_Handle, SQL_Insert_Query);

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
        ON c.user_id=i.user_id; \
    ";
    LoadPlayer = MySQL_PrepareStatement(SQL_Handle, SQL_Load_Query);
    return 1;
}

hook OnPlayerConnect(playerid){
    CreatePlayer(playerid);
    return 1;
}

CreatePlayer(playerid){
    MySQL_ExecuteThreaded(LoadPlayer);
    // [users] table
    MySQL_Bind(InsertPlayer, 0, GetPlayerNameEx(playerid));
    MySQL_Bind(InsertPlayer, 1, User_Discord_ID[playerid]);
    MySQL_Bind(InsertPlayer, 2, User_Password[playerid]);
    MySQL_Bind(InsertPlayer, 3, User_IP[playerid]);
    // [stats] table
    MySQL_BindInt(InsertPlayer, 4, User_Level[playerid]);
    MySQL_BindInt(InsertPlayer, 5, User_EXP[playerid]);
    MySQL_BindFloat(InsertPlayer, 6, User_Hunger[playerid]);
    MySQL_BindFloat(InsertPlayer, 7, User_Thirst[playerid]);
    MySQL_BindFloat(InsertPlayer, 8, User_Health[playerid]);
    MySQL_BindFloat(InsertPlayer, 9, User_Armor[playerid]);
    MySQL_BindFloat(InsertPlayer, 10, User_Stamina[playerid]);
    MySQL_BindFloat(InsertPlayer, 11, User_Strength[playerid]);
    MySQL_BindFloat(InsertPlayer, 12, User_Speed[playerid]);
    MySQL_BindFloat(InsertPlayer, 13, User_Weapon_Skill[playerid]);
    // [class] table
    MySQL_BindFloat(InsertPlayer, 14, User_Position_X[playerid]);
    MySQL_BindFloat(InsertPlayer, 15, User_Position_Y[playerid]);
    MySQL_BindFloat(InsertPlayer, 16, User_Position_Z[playerid]);
    MySQL_BindFloat(InsertPlayer, 17, User_Position_A[playerid]);
    MySQL_BindInt(InsertPlayer, 18, User_Position_Interior[playerid]);
    MySQL_BindInt(InsertPlayer, 19, User_Position_World[playerid]);
    MySQL_Bind(InsertPlayer, 20, User_Class[playerid]);
    MySQL_Bind(InsertPlayer, 21, User_Nationality[playerid]);
    MySQL_Bind(InsertPlayer, 22, User_Gender[playerid]);
    MySQL_BindInt(InsertPlayer, 23, User_Age[playerid]);
    MySQL_Bind(InsertPlayer, 24, User_Accent[playerid]);
    // [inventory] table
    MySQL_BindInt(InsertPlayer, 25, User_Cash[playerid]);
    MySQL_BindInt(InsertPlayer, 26, User_Counterfeit_Cash[playerid]);
    MySQL_BindInt(InsertPlayer, 27, User_Medkit[playerid]);
    MySQL_BindInt(InsertPlayer, 28, User_Bandage[playerid]);
    MySQL_ExecuteThreaded(InsertPlayer);
}

GetPlayerNameEx(playerid){
    new PlayerName[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, PlayerName, MAX_PLAYER_NAME + 1);
    return PlayerName;
}