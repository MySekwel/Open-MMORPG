from core import connection


def Registered(name):
    sql_query = "SELECT * FROM users WHERE user_name = ?"
    connection.SQL_Cursor.execute(sql_query, (name,))
    result = connection.SQL_Cursor.fetchone()
    connection.SQL_Handle.commit()
    return result
