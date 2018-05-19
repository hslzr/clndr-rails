FROM ruby:2.5.1-slim
LABEL maintainer 'Héctor Salazar <salazar@hslzr.com>'

ENV TZ=America/Monterrey
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -qqq update && apt-get -qqq install -y --no-install-recommends \
    build-essential nodejs libsqlite3-dev

RUN mkdir -p /clndr-rails
WORKDIR /clndr-rails

COPY Gemfile .
COPY Gemfile.lock .
COPY . .
