import connection


@connection.connection_handler
def get_all_planet_data(cursor):
    query = """
    SELECT * FROM sw_planets
    """
    cursor.execute(query)
    return cursor.fetchall()

