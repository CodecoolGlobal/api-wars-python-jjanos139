from psycopg2 import sql
import connection
import bcrypt


def hash_password(plain_text_password):
    hashed_bytes = bcrypt.hashpw(plain_text_password.encode('utf-8'), bcrypt.gensalt())
    return hashed_bytes.decode('utf-8')


def verify_password(plain_text_password, hashed_password):
    hashed_bytes_password = hashed_password.encode('utf-8')
    return bcrypt.checkpw(plain_text_password.encode('utf-8'), hashed_bytes_password)


@connection.connection_handler
def get_users(cursor):
    query = """
    SELECT * FROM api_users"""
    cursor.execute(query)
    return cursor.fetchall()


@connection.connection_handler
def get_user_id(cursor, username):
    query = """
    SELECT id FROM api_users
    WHERE username = %(username)s
    """
    cursor.execute(query, {'username': username})
    return cursor.fetchone()


@connection.connection_handler
def get_password(cursor, username):
    query = """
        SELECT password FROM api_users
        WHERE username = %(username)s
        """
    cursor.execute(query, {'username': username})
    return cursor.fetchone()


@connection.connection_handler
def add_user(cursor, username, password):
    query = """
    INSERT INTO api_users (username, password)
    VALUES (
    %(username)s,
    %(password)s)
    """
    cursor.execute(query, {'username': username, 'password': password})


@connection.connection_handler
def save_vote(cursor, planet_id, planet_name, user_id, time):
    query = sql.SQL("""
    INSERT INTO planet_votes (planet_id, planet_name, user_id, submission_time)
    VALUES ({planet_id},
    {planet_name},
    {user_id},
    {time})
    RETURNING id
    """).format(planet_id=sql.Literal(planet_id), planet_name=sql.Literal(planet_name),
                user_id=sql.Literal(user_id), time=sql.Literal(time))
    cursor.execute(query)
    return cursor.fetchall()


@connection.connection_handler
def get_all_votes(cursor):
    query = """
    SELECT planet_name, COUNT(planet_name) FROM planet_votes
    GROUP BY planet_name
    """
    cursor.execute(query)
    return cursor.fetchall()
