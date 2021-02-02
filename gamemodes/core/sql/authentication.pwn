#include <YSI_Coding\y_hooks>

static
    Statement:InsertPlayer,
    Statement:LoadPlayer,
    Statement:SelectPlayer,
    Statement:UpdatePlayer;
hook OnGameModeInit(){
    static const SQL_Query[] = "\
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
    InsertPlayer = MySQL_PrepareStatement(SQL_Handle, SQL_Query);
    return 1;
}

hook OnPlayerConnect(playerid){
    MySQL_Bind(InsertPlayer, 0, "GetPlayerNameEx(playerid)");
    MySQL_Bind(InsertPlayer, 1, "NULL");
    MySQL_Bind(InsertPlayer, 2, "No Password Yet");
    MySQL_Bind(InsertPlayer, 3, "IP Address HACKED!");

    MySQL_BindInt(InsertPlayer, 4, 1);
    MySQL_BindInt(InsertPlayer, 5, 1);
    MySQL_BindFloat(InsertPlayer, 6, 1);
    MySQL_BindFloat(InsertPlayer, 7, 1);
    MySQL_BindFloat(InsertPlayer, 8, 1);
    MySQL_BindFloat(InsertPlayer, 9, 1);
    MySQL_BindFloat(InsertPlayer, 10, 1);
    MySQL_BindFloat(InsertPlayer, 11, 1);
    MySQL_BindFloat(InsertPlayer, 12, 1);
    MySQL_BindFloat(InsertPlayer, 13, 1);

    MySQL_BindFloat(InsertPlayer, 14, 1);
    MySQL_BindFloat(InsertPlayer, 15, 1);
    MySQL_BindFloat(InsertPlayer, 16, 1);
    MySQL_BindFloat(InsertPlayer, 17, 1);
    MySQL_BindInt(InsertPlayer, 18, 1);
    MySQL_BindInt(InsertPlayer, 19, 1);
    MySQL_Bind(InsertPlayer, 20, "Hell Yeah");
    MySQL_Bind(InsertPlayer, 21, "Hell No!");
    MySQL_Bind(InsertPlayer, 22, "Hell!");
    MySQL_BindInt(InsertPlayer, 23, 1);
    MySQL_Bind(InsertPlayer, 24, "Infernus");

    MySQL_BindInt(InsertPlayer, 25, 1);
    MySQL_BindInt(InsertPlayer, 26, 1);
    MySQL_BindInt(InsertPlayer, 27, 1);
    MySQL_BindInt(InsertPlayer, 28, 1);
    MySQL_ExecuteThreaded(InsertPlayer);
    return 1;
}