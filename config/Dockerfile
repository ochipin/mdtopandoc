# ビルド: docker build -t pandoc/myextra . -f config/Dockerfile
# PDF出力: docker run --rm -it -v $(pwd):/data -v /usr/local/share/fonts:/usr/local/share/fonts -v /usr/share/fonts:/usr/share/fonts pandoc/myextra README.md -o example.pdf -d /.pandoc/pandoc.yml
# コンテナに入る: docker run --rm -it --entrypoint="sh" -v $(pwd):/data -v /usr/local/share/fonts:/usr/local/share/fonts -v /usr/share/fonts:/usr/share/fonts pandoc/myextra
# alias登録: alias pandoc='docker run --rm -it -v $(pwd):/data -v /usr/local/share/fonts:/usr/local/share/fonts -v /usr/share/fonts:/usr/share/fonts pandoc/myextra -d /.pandoc/pandoc.yml'
FROM pandoc/extra

COPY ./config/ /.pandoc/
