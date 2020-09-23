#!/bin/sh

if [ $# != 1 ]; then
    echo "引数の指定が違います。"
    exit 1
fi

while COUNT=0 read line
do 
  # カウント
  COUNT=$(( COUNT + 1 ))
  # 切り出し
  COL1=$(echo $line | sed 's/[ ,　]//g' | cut -d , -f 1)
  COL2_4=$(echo $line| cut -d , -f 2-4)
  # ハッシュ値生成
  SHA=$(echo -n $COL1 |openssl md5)
  echo "$SHA","$COL2_4";
done < $1
