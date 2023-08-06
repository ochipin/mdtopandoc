# Pandocを利用して、 Markdown -> PDFへ変換する

Markdownを、PDFへ出力する。以下compose.ymlを用意する。

```yml
# PDF出力: docker-compose run --rm pandoc name.markdown -o example.pdf -d /.pandoc/pandoc.yml -L /.pandoc/filters.lua
# コンテナに入る: docker-compose run --rm --entrypoint="sh" pandoc
services:
  pandoc:
    # PanDocイメージ
    image: pandoc/extra
    # ディレクトリマウント
    volumes:
      # 各種設定ファイルをマウント
      - ./config:/.pandoc
      # PDF出力先をマウント
      - .:/data
      # フォントをマウント
      - /usr/local/share/fonts:/usr/local/share/fonts
      - /usr/share/fonts:/usr/share/fonts

```

docker compose コマンドで、Markdown -> PDFへ出力する。

```sh
# docker compose run --rm pandoc <Markdown> -o <出力先> -d /.pandoc/pandoc.yml
$ docker compose run --rm pandoc README.md -o example.pdf -d /.pandoc/pandoc.yml -L /.pandoc/filters.lua
```

コンテナに入る場合は、次のコマンドを実行する

```
$ docker-compose run --rm --entrypoint="sh" pandoc
```

デフォルトの設定を変更する場合は、 `config` 配下の設定ファイルを変更すること。

 * `pandoc.yml`: 基本設定
 * `templates`: 出力されるPDFのテンプレートファイル
 * `images`: ロゴや背景画像

# dokcer compose を使用しない場合

`alias` コマンドに埋め込み、どこでも使用できるようにするには、`Dockerfile`をビルドして使用する。

```sh
# docker build -t <任意の名前> . -f ./config/Dockerfile
$ docker build -t pandoc/myextra . -f ./config/Dockerfile
```

以下コマンドを実行して、PDFを出力する。
```
$ docker run --rm -it \
    -v $(pwd):/data \
    -v $HOME:/home/user \
    -v /usr/local/share/fonts:/usr/local/share/fonts \
    -v /usr/share/fonts:/usr/share/fonts \
  pandoc/myextra README.md -o example.pdf -d /.pandoc/pandoc.yml -L /.pandoc/filters.lua
```

コマンドが長いので、`alias`に登録する。

```sh
$ alias pandoc='docker run --rm -it -v $(pwd):/data -v $HOME:/home/user -v /usr/local/share/fonts:/usr/local/share/fonts -v /usr/share/fonts:/usr/share/fonts pandoc/myextra -d /.pandoc/pandoc.yml -L /.pandoc/filters.lua'
# PDFにする
$ pandoc README.md -o example.pdf
# 複数の*.mdファイルを1つのPDFにする
$ pandoc README1.md README2.md README3.md -o example.pdf
```

# Markdownで取り扱えるメタデータ

次のメタ情報を、Markdownファイルの先頭に追加できる。

```markdown
---
title: Markdown -> PDFへ変換するコンテナ
subtitle: 1.0版
author:  落合 優
date: 2023/05/26
keywords: [Markdown, Pandoc]
abstract: |
  | 版  | 発行日     | 節 | 改版内容 |
  |:--  |:--         |:-- |:--       |
  | 1.0 | YYYY.MM.DD | -  | 新規発行 |
---

概要
===

...

```

# 好きなフォントを使用する
次の手順を実行することで、自分の好きなフォントをPDFで使うことができる。

1. `/usr/local/share/fonts` 内に、ttf,otfなどのフォントファイルを格納する  
   ```sh
   # aptなどを使って、フォントをインストールする例
   $ sudo apt install fonts-roboto fonts-ipaexfont
   # TTFファイルなどを直接格納する場合
   $ sudo mkdir /usr/local/share/fonts/myfonts
   $ sudo mv /path/to/font.ttf /usr/local/share/fonts/myfonts
   ```
2. pandoc.yml のフォント設定項目を変更する  
   ```yaml
   mainfont: 'BIZ UDPGothic'
   sansfont: 'BIZ UDPGothic'
   CJKmainfont: 'BIZ UDPGothic'
   monofont: 'BIZ UDGothic'
   ```
3. docker image を作り直す  
   ```sh
   # docker build -t <任意の名前> . -f ./config/Dockerfile
   $ docker build -t pandoc/myextra . -f ./config/Dockerfile
   ```
