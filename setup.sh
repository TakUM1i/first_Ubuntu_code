#!/bin/bash

echo "--- 1. パッケージの更新とインストール ---"
apt update
apt install -y python3-pip python3-flask vim language-pack-ja

echo "--- 2. 日本語化設定 ---"
update-locale LANG=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

echo "--- 3. Vimの設定 (UTF-8) ---"
echo "set encoding=utf-8" > ~/.vimrc
echo "set fileencoding=utf-8" >> ~/.vimrc

echo "--- 4. APIファイルの自動作成 ---"
cat <<EOF > app.py
from flask import Flask
app = Flask(__name__)

@app.route('/notify')
def notify():
    with open("app.log", "a") as f:
        f.write("リクエストを受信しました！\n")
    return "Notification received!\n"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

echo "すべてのセットアップが完了しました！"
echo "python3 app.py でサーバーを起動できます。"
