#include <a_samp>
#include <a_mysql>

#define YSI_YES_HEAP_MALLOC
#include <YSI_Coding\y_va>
#include <YSI_Coding\y_inline>
#include <mysql_prepared>
#include <env>

#include "core/sql/connection.pwn"

main(){
    print("Gamemode Started!");
}

public OnGameModeInit(){
    print("Gamemode Initializing...");
    return 1;
}