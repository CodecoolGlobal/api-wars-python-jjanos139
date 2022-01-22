from flask import Flask, session, redirect, url_for, escape, request, render_template, flash

app = Flask(__name__)

@app.route('/')
def main():
    return render_template('index.html')


if __name__ == '__main__':
    app.run(
        host='0.0.0.0',
        port=5000,
        debug=True,
    )