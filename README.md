# earthquake_map

過去の地震情報を可視化するアプリ

![](https://storage.googleapis.com/zenn-user-upload/7b9e08d432bf-20240702.gif)

## ディレクトリ構成

```
.
├── flutter...メインのアプリ
└── python...地震データを加工するためのスクリプト
```

## 地震データを加工する方法

1. P2P 地震情報 API からデータを取得

```cmd
curl -o ~/dir/example.json -X GET \
  "https://api.p2pquake.net/v2/jma/quake?limit=100&since_date=20230511&min_scale=30&order=1" \
  -H  "accept: application/json"
```

2. スクリプトコマンドを実行

```cmd
cd python
python3 main.py
```

3. earthquake_data.json が出力されるので、`flutter/assets/下`へコピぺ
