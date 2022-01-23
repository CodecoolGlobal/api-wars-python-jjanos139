from flask import Flask, session, redirect, url_for, escape, request, render_template, flash

import data_manager

app = Flask(__name__)

@app.route('/')
def main():
    planets = data_manager.get_all_planet_data()
    return render_template('index.html', planets=planets)


if __name__ == '__main__':
    app.run(
        host='0.0.0.0',
        port=5000,
        debug=True,
    )