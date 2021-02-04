#include <YSI_Coding\y_hooks>

new
    Player_Name[MAX_PLAYERS][MAX_PLAYER_NAME+1],
    Player_Discord_ID[MAX_PLAYERS][MAX_DISCORD_ID],
    Player_Password[MAX_PLAYERS][MAX_PASSWORD],
    Player_IP[MAX_PLAYERS][MAX_IP],
    Player_Level[MAX_PLAYERS],
    Player_EXP[MAX_PLAYERS],
    Float:Player_Hunger[MAX_PLAYERS],
    Float:Player_Thirst[MAX_PLAYERS],
    Float:Player_Health[MAX_PLAYERS],
    Float:Player_Armor[MAX_PLAYERS],
    Float:Player_Stamina[MAX_PLAYERS],
    Float:Player_Strength[MAX_PLAYERS],
    Float:Player_Speed[MAX_PLAYERS],
    Float:Player_Weapon_Skill[MAX_PLAYERS],
    Float:Player_Position_X[MAX_PLAYERS],
    Float:Player_Position_Y[MAX_PLAYERS],
    Float:Player_Position_Z[MAX_PLAYERS],
    Float:Player_Position_A[MAX_PLAYERS],
    Player_Position_Interior[MAX_PLAYERS],
    Player_Position_World[MAX_PLAYERS],
    Player_Class[MAX_PLAYERS][MAX_CLASS],
    Player_Nationality[MAX_PLAYERS][MAX_NATIONALITY],
    Player_Gender[MAX_PLAYERS][MAX_GENDER],
    Player_Age[MAX_PLAYERS],
    Player_Accent[MAX_PLAYERS][MAX_ACCENT],
    Player_Cash[MAX_PLAYERS],
    Player_Counterfeit_Cash[MAX_PLAYERS],
    Player_Medkit[MAX_PLAYERS],
    Player_Bandage[MAX_PLAYERS];
    
hook OnPlayerConnect(playerid){
    // User Defaults
    format(Player_Name[playerid], MAX_PLAYER_NAME+1, GetPlayerNameEx(playerid));
    format(Player_Discord_ID[playerid], MAX_DISCORD_ID, "N/A");
    format(Player_Password[playerid], MAX_PASSWORD, "N/A");
    GetPlayerIp(playerid, Player_IP[playerid], MAX_IP);
    Player_Level[playerid] = 1;
    Player_EXP[playerid] = 0;
    Player_Hunger[playerid] = 100.0;
    Player_Thirst[playerid] = 100.0;
    Player_Health[playerid] = 150.0;
    Player_Armor[playerid] = 10.0;
    Player_Stamina[playerid] = 200.0;
    Player_Strength[playerid] = 20.0;
    Player_Speed[playerid] = 20.0;
    Player_Weapon_Skill[playerid] = 10.0;
    Player_Position_X[playerid] = 0.0;
    Player_Position_Y[playerid] = 0.0;
    Player_Position_Z[playerid] = 0.0;
    Player_Position_A[playerid] = 0.0;
    Player_Position_Interior[playerid] = 0;
    Player_Position_World[playerid] = 0;
    format(Player_Class[playerid], MAX_CLASS, "Thug");
    format(Player_Nationality[playerid], MAX_NATIONALITY, "American");
    format(Player_Gender[playerid], MAX_CLASS, "Male");
    Player_Age[playerid] = 18;
    format(Player_Accent[playerid], MAX_ACCENT, "English");
    Player_Cash[playerid] = 100;
    Player_Counterfeit_Cash[playerid] = 0;
    Player_Medkit[playerid] = 0;
    Player_Bandage[playerid] = 0;
    return 1;
}