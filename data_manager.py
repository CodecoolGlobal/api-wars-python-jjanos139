import connection
import bcrypt


@connection.connection_handler
def get_all_planet_data(cursor):
    query = """
    SELECT sw_planets.name, sw_planets.diameter,
    sw_planets.climate, sw_planets.terrain,
    sw_planets.surface_water, sw_planets.population,
    COUNT(r.home_planet) AS residents FROM sw_planets
    LEFT JOIN residents r on sw_planets.name = r.home_planet
    GROUP BY sw_planets.name, sw_planets.diameter, sw_planets.climate, sw_planets.terrain, sw_planets.surface_water, sw_planets.population
    """
    cursor.execute(query)
    return cursor.fetchall()


def hash_password(plain_text_password):
    hashed_bytes = bcrypt.hashpw(plain_text_password.encode('utf-8'), bcrypt.gensalt())
    return hashed_bytes.decode('utf-8')


def verify_password(plain_text_password, hashed_password):
    hashed_bytes_password = hashed_password.encode('utf-8')
    return bcrypt.checkpw(plain_text_password.encode('utf-8'), hashed_bytes_password)


@connection.connection_handler
def get_users(cursor):
    query = f"""
    SELECT * FROM api_users"""
    cursor.execute(query)
    return cursor.fetchall()


@connection.connection_handler
def get_password(cursor, username):
    query = f"""
        SELECT password FROM api_users
        WHERE username = %(username)s
        """
    cursor.execute(query, {'username': f"{username}"})
    return cursor.fetchone()


@connection.connection_handler
def add_user(cursor, username, password):
    query = f"""
    INSERT INTO api_users (username, password)
    VALUES (
    %(username)s,
    %(password)s)
    """
    cursor.execute(query, {'username': f"{username}", 'password': f"{password}"})


@connection.connection_handler
def get_all_people_data(cursor):
    query = f"""
    SELECT * FROM residents"""
    cursor.execute(query)
    return cursor.fetchall()
