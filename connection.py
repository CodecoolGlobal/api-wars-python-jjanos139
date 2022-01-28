import os
import psycopg2
import psycopg2.extras


def get_connection_string():
    # setup connection string
    # to do this, please define these environment variables first
    user_name = 'cvajuhmapdhtor'
    password = 'fa5a82f16290a2782e4bc6e515812f116dc0733bde5f2f7ff7af92f76a10266b'
    host = 'ec2-54-228-95-1.eu-west-1.compute.amazonaws.com:5432'
    database_name = 'd75tg1j7gq6pqe'
    DATABASE_URL = os.environ['DATABASE_URL']

    env_variables_defined = user_name and password and host and database_name

    if env_variables_defined:
        # this string describes all info for psycopg2 to connect to the database
        return 'postgresql://{user_name}:{password}@{host}/{database_name}'.format(
            user_name=user_name,
            password=password,
            host=host,
            database_name=database_name
        )
    else:
        raise KeyError('Some necessary environment variable(s) are not defined')


def open_database():
    try:
        connection_string = get_connection_string()
        connection = psycopg2.connect(connection_string)
        connection.autocommit = True
    except psycopg2.DatabaseError as exception:
        print('Database connection problem')
        raise exception
    return connection


def connection_handler(function):
    def wrapper(*args, **kwargs):
        connection = open_database()
        # we set the cursor_factory parameter to return with a RealDictCursor cursor (cursor which provide dictionaries)
        dict_cur = connection.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        ret_value = function(dict_cur, *args, **kwargs)
        dict_cur.close()
        connection.close()
        return ret_value

    return wrapper
