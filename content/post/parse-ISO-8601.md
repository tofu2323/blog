---
title: "Parse ISO 8601"
date: 2018-08-20T09:47:34+09:00
categories:
- programming
- tips
tags:
- python
#keywords:
#- tech
#thumbnailImage: //example.com/image.jpg
#thumbnailImagePosition:right
#coverImage: image-2.png
#coverCaption: "A beautiful sunrise"
#gallery:
#    - image-3.jpg "New York"
---

ISO 8601型のstringをpythonのdate型に変換する方法。

<!--more-->

## ISO 8601 ?

`2018-08-31T03:00:00.000Z`

## やりかた

`"%Y-%m-%dT%H:%M:%S.%fZ"`でparse


```py
from datetime import datetime
str_date = "2018-08-31T03:00:00.000Z"
datetime.strptime(str_date, "%Y-%m-%dT%H:%M:%S.%fZ")
```
