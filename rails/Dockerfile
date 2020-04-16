FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
WORKDIR /app
COPY ./datalake/Gemfile /app/Gemfile
COPY ./datalake/Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY ./datalake /app

EXPOSE 3000