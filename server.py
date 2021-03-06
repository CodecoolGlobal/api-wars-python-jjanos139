from datetime import datetime
from flask import Flask, session, redirect, url_for, escape, request, render_template, flash, jsonify
import data_manager

app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'


@app.route('/')
def main():
    return render_template('index.html')


@app.route('/registration', methods=['GET', 'POST'])
def registration():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        hashed_password = data_manager.hash_password(password)
        users = data_manager.get_users()
        usernames = []
        for user in users:
            usernames.append(user['username'])
        if username in usernames:
            return render_template('registration.html', message="Username already exists, please choose another one!")
        data_manager.add_user(username, hashed_password)
        return render_template('index.html', message="Successful registration.")
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
        if username in usernames:
            hashed_password = data_manager.get_password(username)['password']
            is_matching = data_manager.verify_password(password, hashed_password)
            if is_matching:
                session['username'] = username
                session['password'] = password
                return redirect(url_for('main'))
            else:
                return render_template('login.html', message=' Wrong username or password')
        else:
            return render_template('login.html', message=' Wrong username or password')
    return render_template('login.html')


@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('main'))


@app.route('/save-new-votes/', methods=['POST', 'GET'])
def save_new_votes():
    data = request.get_json()
    planet_id = data['planet_id']
    planet_name = str(data['planet_name'])
    username = session['username']
    time = datetime.now()
    user_id = str(data_manager.get_user_id(username)['id'])
    data_manager.save_vote(planet_id, planet_name, user_id, time)
    return 'Added'


@app.route('/get-votes/')
def get_votes():
    return jsonify(data_manager.get_all_votes())


if __name__ == '__main__':
    app.run(
        host='0.0.0.0',
        port=5000,
        debug=True,
    )
