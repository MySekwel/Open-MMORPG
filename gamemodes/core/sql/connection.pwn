#include <YSI_Coding\y_hooks>

new MySQL:SQL_Handle;

hook OnGameModeInit(){
    new MySQLOpt:SQL_Options = mysql_init_options();

    mysql_log(ALL);
    mysql_set_option(SQL_Options, MULTI_STATEMENTS, true);
    SQL_Handle = mysql_connect("127.0.0.1", "root", "", "open_mmorpg_db", SQL_Options);
    mysql_tquery_file(SQL_Handle, "sql/setup.sql");
    return 1;
}

hook OnGameModeExit(){
    printf("MySQL: There are %d unprocessed queries.", mysql_unprocessed_queries());
    mysql_close(SQL_Handle);
    return 1;
}