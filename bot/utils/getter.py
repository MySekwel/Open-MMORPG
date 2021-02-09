from core import connection


def GetUIDFromUserName(name):
    sql_query = "SELECT uid FROM users WHERE user_name = ?"
    connection.SQL_Cursor.execute(sql_query, (name,))


def GetUserNameFromUID(uid):
    sql_query = "SELECT user_name FROM users WHERE uid = ?"
    connection.SQL_Cursor.execute(sql_query, (uid,))


def GetIPFromUserName(name):
    sql_query = "SELECT user_ip FROM users WHERE user_name = ?"
    connection.SQL_Cursor.execute(sql_query, (name,))
