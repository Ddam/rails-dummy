########################################
FROM ruby:2.5-alpine as build_ruby

RUN apk add --update --no-cache --virtual .persistent-deps \
    icu-libs \
    zlib \
    mariadb-dev \
    build-base \
    libxslt-dev \
    libxml2-dev \
    nodejs

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

ENV RAILS_ENV production

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

COPY . ./

###############################
FROM build_ruby as build_ruby_dev

ENV RAILS_ENV development

RUN apk add --no-cache --virtual .persistent-deps \
    bash \
    git \
    zsh

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true \
    && sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"ys\"/g" ~/.zshrc \
    && sed -i "s/  git/  git rails ruby bundler/g" ~/.zshrc
