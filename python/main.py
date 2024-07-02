import json
import datetime
from dateutil.relativedelta import relativedelta
import copy

"""
地震APIから取得したJSONを使いやすいデータ形式に加工する
curl -o ~/Downloads/example.json -X GET \
  "https://api.p2pquake.net/v2/jma/quake?limit=100&since_date=20230511&min_scale=30&order=1" \
  -H  "accept: application/json"
"""
f = open("example.json", "r")
data = f.read()
f.close()

json_data = json.loads(data)

extraction_json_data = []
year_month_list = []
first_date = json_data[0]["earthquake"]["time"][:10]
last_date = json_data[-1]["earthquake"]["time"][:10]

first_datetime = datetime.datetime(
    int(first_date[:4]), int(first_date[5:7]), int(first_date[8:10])
)
last_datetime = datetime.datetime(
    int(last_date[:4]), int(last_date[5:7]), int(last_date[8:10])
)

# データの開始年月と最新年月の間の年月配列
datetime_item = copy.deepcopy(first_datetime)
while datetime_item <= last_datetime:
    year_month_str = datetime_item.strftime("%Y/%m")
    year_month_list.append(year_month_str)
    datetime_item += relativedelta(months=+1)

# 必要なデータのみ出力
for item in json_data:
    # 震源情報が存在しないデータを弾く
    if int(item["earthquake"]["hypocenter"]["magnitude"]) == -1:
        continue
    # 時間をFlutterのDateTImeへ合わせる
    datetime_str = item["earthquake"]["time"]
    datetime_dt = datetime.datetime(
        int(datetime_str[:4]),
        int(datetime_str[5:7]),
        int(datetime_str[8:10]),
        int(datetime_str[11:13]),
        int(datetime_str[14:16]),
        int(datetime_str[17:19]),
    )

    extraction_json = {
        "id": item["id"],
        "earthquake": item["earthquake"]["hypocenter"],
        "maxScale": item["earthquake"]["maxScale"],
        "time": datetime_dt.strftime("%Y-%m-%d %H:%M:%S"),
        "year_month": item["time"][:7],
    }
    extraction_json_data.append(extraction_json)


earthquake_json = []
# 年月でグループ化
for year_month in year_month_list:

    def same_year_month(x):
        return x["year_month"] == year_month

    filtered_values = filter(same_year_month, extraction_json_data)
    earthquake_data = list(filtered_values)
    earthquake_json.append(earthquake_data)


result = {
    "first_date": first_datetime.strftime("%Y-%m-01 00:00:00"),
    "last_date": last_datetime.strftime("%Y-%m-01 00:00:00"),
    "data": earthquake_json,
}
# ファイル出力
# ensure_ascii=Falseでエスケープさせない
f = open("earthquake_data.json", "w", encoding="utf-8")
f.write(json.dumps(result, ensure_ascii=False, indent=2))
f.close()
