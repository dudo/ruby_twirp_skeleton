FROM golang:1.15 AS go

# Install necessary Go executable to build protos
RUN go get github.com/twitchtv/twirp-ruby/protoc-gen-twirp_ruby

FROM ruby:2.7

LABEL maintainer="Brett Dudo <brett@dudo.io>"

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client redis
COPY --from=go /go/bin /usr/local/bin

ENV HOME /usr/src/app
WORKDIR $HOME

# Cleanup
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure bundler
ENV LANG C.UTF-8
ENV GEM_HOME /usr/local/bundle

ADD Gemfile* ./
RUN gem update --system && \
    gem install bundler
RUN bundle config set without 'test development' && \
    bundle install --jobs 4 --retry 3

ADD . ./

EXPOSE 50052

# Start app
USER 1000
ENTRYPOINT  [ "bundle" ]
CMD [ "exec", "rackup", "-o", "0.0.0.0", "-p", "50052" ]
