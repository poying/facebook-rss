facebook-rss
============

產生 Facebook 專頁 RSS 檔案

### 安裝

```bash
$ git clone https://github.com/poying/facebook-rss.git
$ cd facebook-rss
$ make install
```

### 使用

> 搭配 IFTTT、drone.io、GitHub Pages 每隔幾小時自動重新產生 RSS

```bash
$ # 取得 facebook token
$ curl "https://graph.facebook.com/v2.7/oauth/access_token?client_id=<app_id>&client_secret=<app_secret>&grant_type=client_credentials"
$ # 產生 rss
$ facebook-rss --token <access_token> --id <page_id>
```
