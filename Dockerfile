FROM ruby:2.7.1-alpine3.11
MAINTAINER Sergey Kandyla <skandyla@gmail.com>
RUN apk add --no-cache build-base git && \
    gem install travis && \
    gem install travis-lint && \
    apk del build-base &&\
    mkdir project
WORKDIR project
VOLUME ["/project"]
ENTRYPOINT ["travis"]
