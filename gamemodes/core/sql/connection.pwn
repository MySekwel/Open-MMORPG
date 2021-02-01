#include <YSI_Coding\y_hooks>

new MySQL:SQL_Handle;

static
    SQL_Host[] = "",
    SQL_User[] = "",
    SQL_Password[] = "",
    SQL_Database[] = "";

hook OnGameModeInit(){
    new MySQLOpt:SQL_Options = mysql_init_options();

    mysql_log(ALL);
    mysql_set_option(SQL_Options, MULTI_STATEMENTS, true);
    SQL_Handle = mysql_connect(SQL_Host, SQL_User, SQL_Password, SQL_Database);
    return 1;
}

hook OnGameModeExit(){
    printf("WARNING: There are %d unprocessed queries.", mysql_unprocessed_queries());
    mysql_close(SQL_Handle);
    return 1;
}