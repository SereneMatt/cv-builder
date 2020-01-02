FROM ruby:2.6.0

LABEL maintainer="SERENE_MATT"

RUN gem install bundler -v 1.17.2 --no-ri --no-rdoc

RUN mkdir /src
WORKDIR /src

COPY Gemfile Gemfile.lock ./

RUN bundle install

# Copy the main application.
COPY . ./

CMD ./start-dev.sh