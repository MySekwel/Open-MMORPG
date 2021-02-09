from core import connection


def GetUIDFromUserName(name):
    sql_query = "SELECT user_id FROM users WHERE user_name = ?"
    connection.SQL_Cursor.execute(sql_query, (name,))
    result = connection.SQL_Cursor.fetchone()
    connection.SQL_Handle.commit()
    return result[0]


def GetUserNameFromUID(user_id):
    sql_query = "SELECT user_name FROM users WHERE user_id = ?"
    connection.SQL_Cursor.execute(sql_query, (user_id,))
    result = connection.SQL_Cursor.fetchone()
    connection.SQL_Handle.commit()
    return result[0]


def GetIPFromUserUID(user_id):
    sql_query = "SELECT user_ip FROM users WHERE user_id = ?"
    connection.SQL_Cursor.execute(sql_query, (user_id,))
    result = connection.SQL_Cursor.fetchone()
    connection.SQL_Handle.commit()
    return result[0]
