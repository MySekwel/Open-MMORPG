/**
* -----------------------
* MODULE: Main
* DESCRIPTION: Main module imports all the modules to be compiled into a binary, "main.amx".
* PATH: [gamemodes/main.pwn]
* TODO: Nothing Yet
* -----------------------
**/
#include <a_samp>
#include <a_mysql>

#define YSI_YES_HEAP_MALLOC
#include <YSI_Coding\y_va>
#include <YSI_Coding\y_inline>
#include <mysql_prepared>

#include "core/sql/connection.pwn"

main(){
    print("Gamemode Started!");
}

public OnGameModeInit(){
    print("Gamemode Initializing...");
    return 1;
}