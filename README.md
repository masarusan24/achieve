Achive
====

Achieveは、[Dive into Code](https://diveintocode.jp/)受講生が最低限Railsを動かせるかを測るお試しアプリです。
Achieveを作り終えることで、これからの学習に必要な事前知識を身に着けることができます。

![achieve 2018-02-21 11-05-16](https://user-images.githubusercontent.com/17737460/36459459-323a6ae0-16f7-11e8-853a-b2736b5c7cc2.png)

## Description
Achieveを一言で表すと、練習用のブログ作成アプリです。
ブログを投稿する機能をつけることで、Railsの機能の一端を学ぶことができます。

## Requirement
- Ruby 2.3.1
- Rails 5.1.4
- PostgreSQL 10.1

## Usage
このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。

```
$ git clone git@github.com:masarusan24/achieve.git
```

次に、以下のコマンドで必要になる Ruby Gems をインストールします。

```
$ bundle install
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

これで、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[masarusan24](https://github.com/masarusan24)
