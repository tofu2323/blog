---
title: "Access to Image at GCS has been blocked by CORS"
date: 2018-07-11T12:22:58+09:00
categories:
- GCP
- ERRORS
tags:
- GCP
- GCS
- ERROR
#keywords:
#- tech
#thumbnailImage: //example.com/image.jpg
#thumbnailImagePosition:right
#coverImage: image-2.png
#coverCaption: "A beautiful sunrise"
#gallery:
#    - image-3.jpg "New York"
---

開発中にGCS(Google Cloud Storage)から画像を取得しようとしたらCORSのエラーが出た時のメモ。

<!--more-->

こんなエラーが出た。
```
Access to Image at 'https://storage.googleapis.com/{bucketname}/XXX.png' from origin 'http://localhost:3101' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://localhost:3101' is therefore not allowed access.
```

GCSにCORSの設定をする必要があるらしい。

こんなファイルを用意

```json
$ cat gcs-cors.json
[
    {
      "origin": ["*"],
      "responseHeader": ["Content-Type", "Access-Control-Allow-Origin"],
      "method": ["OPTIONS","GET", "HEAD", "DELETE"],
      "maxAgeSeconds": 3600
    }
]
```

そして、下記のコマンド実行で完了。

```
$ gsutil cors set gcs-cors.json gs://{bucketname}
Setting CORS on gs://{bucketname}/...
```

これで確認もできる。

```
$ gsutil cors get gs://{bucketname}
[{"maxAgeSeconds": 3600, "method": ["OPTIONS", "GET", "HEAD", "DELETE"], "origin": ["*"], "responseHeader": ["Content-Type", "Access-Control-Allow-O
rigin"]}]
```