FROM ruby:3.1.2-alpine

ARG app=/opt/app
WORKDIR $app

# libxml2-dev and libxslt-dev for nokogiri compiling
RUN apk add --update --no-cache \
  build-base \
  tzdata \
  imagemagick \
  libxml2-dev libxslt-dev \
  postgresql-dev

ADD Gemfile Gemfile.lock ./
RUN gem install bundler && \
    bundle config set deployment 'false' && \
    bundle config set with 'development' && \
    bundle config set --local force_ruby_platform true && \
    bundle config set --local build.nokogiri "--use-system-libraries" && \
    bundle install

ENV RAILS_ROOT=$app \
    RAILS_ENV=${RAILS_ENV:-production} \
    RACK_ENV=${RAILS_ENV:-production} \
    NODE_ENV=${NODE_ENV:-production} \
    RAILS_LOG_TO_STDOUT=${RAILS_LOG_TO_STDOUT:-yes}

ADD . ./

EXPOSE 8080
CMD bundle exec puma -b tcp://0.0.0.0:8080
