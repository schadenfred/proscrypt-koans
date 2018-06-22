FROM ruby:2.5

LABEL maintainer="fred.schoeneman@gmail.com"
RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs qt5-default

COPY Gemfile* /usr/src/app/

WORKDIR /usr/src/app

RUN bundle install

COPY . /usr/src/app/
