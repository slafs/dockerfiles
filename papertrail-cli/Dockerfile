FROM alpine:latest

MAINTAINER "Sławek Ehlert <slafs.e@gmail.com>"

RUN apk add --update --no-cache ruby ruby-json ca-certificates

RUN gem install --no-document papertrail

ENTRYPOINT ["papertrail"]
