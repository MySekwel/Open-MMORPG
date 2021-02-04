/**
* -----------------------
* MODULE: Main
* DESCRIPTION: Main module imports all the modules to be compiled into a binary, "main.amx".
* PATH: [gamemodes/main.pwn]
* -----------------------
**/
#include <a_samp>
#include <a_mysql>
#include <vector>

#define YSI_YES_HEAP_MALLOC
#include <YSI_Coding\y_va>
#include <YSI_Coding\y_inline>
#include <mysql_prepared>

#include "utils/limits.pwn"
#include "core/sql/connection.pwn"
#include "core/user/user.pwn"
#include "core/sql/authentication.pwn"

public OnGameModeInit(){
    print("Gamemode Initializing...");
    return 1;
}

main(){
    print("Gamemode Started!");
}
