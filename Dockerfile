FROM ruby:2.5

LABEL maintainer="fred.schoeneman@gmail.com"
RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs

COPY Gemfile* /usr/src/app/

WORKDIR /usr/src/app

RUN bundle install

COPY . /usr/src/app/

# may not need this with docker-compoase "command" under "build"
# CMD ["rails", "s", "-b", "0.0.0.0"]
