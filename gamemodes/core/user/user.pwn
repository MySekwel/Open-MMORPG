#include <YSI_Coding\y_hooks>
new
    User_Name[MAX_PLAYERS][MAX_PLAYER_NAME+1],
    User_Discord_ID[MAX_PLAYERS][MAX_DISCORD_ID],
    User_Password[MAX_PLAYERS][MAX_PASSWORD],
    User_IP[MAX_PLAYERS][MAX_IP],
    User_Level[MAX_PLAYERS],
    User_EXP[MAX_PLAYERS],
    Float:User_Hunger[MAX_PLAYERS],
    Float:User_Thirst[MAX_PLAYERS],
    Float:User_Health[MAX_PLAYERS],
    Float:User_Armor[MAX_PLAYERS],
    Float:User_Stamina[MAX_PLAYERS],
    Float:User_Strength[MAX_PLAYERS],
    Float:User_Speed[MAX_PLAYERS],
    Float:User_Weapon_Skill[MAX_PLAYERS],
    Float:User_Position_X[MAX_PLAYERS],
    Float:User_Position_Y[MAX_PLAYERS],
    Float:User_Position_Z[MAX_PLAYERS],
    Float:User_Position_A[MAX_PLAYERS],
    User_Position_Interior[MAX_PLAYERS],
    User_Position_World[MAX_PLAYERS],
    User_Class[MAX_PLAYERS][MAX_CLASS],
    User_Nationality[MAX_PLAYERS][MAX_NATIONALITY],
    User_Gender[MAX_PLAYERS][MAX_GENDER],
    User_Age[MAX_PLAYERS],
    User_Accent[MAX_PLAYERS][MAX_ACCENT],
    User_Cash[MAX_PLAYERS],
    User_Counterfeit_Cash[MAX_PLAYERS],
    User_Medkit[MAX_PLAYERS],
    User_Bandage[MAX_PLAYERS];
    
hook OnPlayerConnect(playerid){
    format(User_Name[playerid], MAX_PLAYER_NAME+1, GetPlayerNameEx(playerid));
    format(User_Discord_ID[playerid], MAX_DISCORD_ID, "N/A");
    format(User_Password[playerid], MAX_PASSWORD, "N/A");
    GetPlayerIp(playerid, User_IP[playerid], MAX_IP);
    User_Level[playerid] = 1;
    User_EXP[playerid] = 0;
    User_Hunger[playerid] = 100.0;
    User_Thirst[playerid] = 100.0;
    User_Health[playerid] = 150.0;
    User_Armor[playerid] = 10.0;
    User_Stamina[playerid] = 200.0;
    User_Strength[playerid] = 20.0;
    User_Speed[playerid] = 20.0;
    User_Weapon_Skill[playerid] = 10.0;
    User_Position_X[playerid] = 0.0;
    User_Position_Y[playerid] = 0.0;
    User_Position_Z[playerid] = 0.0;
    User_Position_A[playerid] = 0.0;
    User_Position_Interior[playerid] = 0;
    User_Position_World[playerid] = 0;
    format(User_Class[playerid], MAX_CLASS, "Thug");
    format(User_Nationality[playerid], MAX_NATIONALITY, "American");
    format(User_Gender[playerid], MAX_CLASS, "Male");
    User_Age[playerid] = 18;
    format(User_Accent[playerid], MAX_ACCENT, "English");
    User_Cash[playerid] = 100;
    User_Counterfeit_Cash[playerid] = 0;
    User_Medkit[playerid] = 0;
    User_Bandage[playerid] = 0;
    return 1;
}