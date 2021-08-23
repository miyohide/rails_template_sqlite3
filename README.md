# 作業用メモ

# Railsのコマンドを実行する

コンテナの中に入って、そこで`bin/rails`コマンドを叩く。

```
$ docker-compose run --rm web bash
root@xxxxxx:/app# bin/rails g scaffold runrecord starttime:timestamp distance:float runtime:integer
```

# Railsアプリの実行

```
$ docker-compose run --rm --service-ports web
```

# Gemの追加をしたいとき

```
$ docker-compose run --rm web bash
root@xxxxxx:/app# bundle install
```

# Gemの更新をしたいとき

```
$ docker-compose run --rm web bash
root@xxxxxx:/app# bundle update
```

# JavaScriptライブラリの更新をしたいとき

```
$ docker-compose run --rm web bash
root@xxxxxx:/app# yarn upgrade
```
