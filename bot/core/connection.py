from mysql import connector
from utils import settings

SQL_Handle = connector.connect(
    host=settings.SQL_HOST,
    database=settings.SQL_DATABASE,
    user=settings.SQL_USER,
    password=settings.SQL_PASSWORD
)

SQL_Cursor = SQL_Handle.cursor(prepared=True)
