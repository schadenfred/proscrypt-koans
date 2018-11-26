FROM ruby:2.5.3-alpine


LABEL maintainer="fred.schoeneman@gmail.com"

RUN apk add --no-cache --update build-base linux-headers postgresql-dev nodejs tzdata

COPY Gemfile* /usr/src/app/

WORKDIR /usr/src/app

RUN bundle install

COPY . /usr/src/app/
