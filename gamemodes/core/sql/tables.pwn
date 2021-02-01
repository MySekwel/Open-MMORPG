#include <YSI_Coding\y_hooks>

hook OnGameModeInit(){
    static const SQL_USERS_Query = "\
        CREATE TABLE IF NOT EXISTS \
        users(\
            user_uid INT NOT NULL AUTO_INCREMENT, \
            user_name VARCHAR(24),\
            user_discord_id VARCHAR(20), \
            user_password VARCHAR(60), \
            user_ip VARCHAR(15), \
            PRIMARY KEY(user_uid), \
            UNIQUE KEY(user_name)
        )";
    
    static const SQL_INVENTORY_Query = "\
        CREATE TABLE IF NOT EXISTS \
        inventory(\
            user_uid INT NOT NULL AUTO_INCREMENT, \
            user_name VARCHAR(24),\
            user_discord_id VARCHAR(20), \
            user_password VARCHAR(60), \
            user_ip VARCHAR(15), \
            PRIMARY KEY(user_uid), \
            UNIQUE KEY(user_name)
        )";
    mysql_tquery(SQL_Handle, SQL_Query);
    return 1;
}