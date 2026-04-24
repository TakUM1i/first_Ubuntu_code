from flask import Flask
app = Flask(__name__)

@app.route('/notify')
def notify():
    with open("app.log", "a") as f:
        f.write("リクエストを受信しました！\n")
    return "Notification received!\n"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
