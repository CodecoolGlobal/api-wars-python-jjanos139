from flask import Flask, session, redirect, url_for, escape, request, render_template, flash
import data_manager

app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'


@app.route('/')
def main():
    planets = data_manager.get_all_planet_data()
    return render_template('index.html', planets=planets)


@app.route('/registration', methods=['GET', 'POST'])
def registration():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        users = data_manager.get_users()
        usernames = []
        for user in users:
            usernames.append(user['username'])
        if username in usernames:
            return render_template('registration.html', message="Username already in use")
        data_manager.add_user(username, password)
        # hashed_password = data_manager.hash_password(password)
        # user_id = data_manager.add_user(username, hashed_password)
        # user = data_manager.get_user(user_id)
        return redirect(url_for('main'))
    return render_template('registration.html')


@app.route('/login', methods=["GET", "POST"])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        users = data_manager.get_users()
        usernames = []
        for user in users:
            usernames.append(user['username'])
        if username in usernames and password == data_manager.get_password(username)['password']:
            # hashed_password = data_manager.get_password(session['username'])['password']
            # if data_manager.verify_password(password, hashed_password):
            session['username'] = username
            session['password'] = password
            return redirect(url_for('main'))
        else:
            return render_template('login.html', message='Invalid password or email!')
    return render_template('login.html')


@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('main'))


if __name__ == '__main__':
    app.run(
        host='0.0.0.0',
        port=5000,
        debug=True,
    )
