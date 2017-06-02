FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install -y pdftk \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["pdftk"]
