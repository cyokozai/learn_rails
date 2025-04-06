FROM ruby:latest

WORKDIR /app/service

COPY Gemfile* /app/service/

RUN apt -y update && apt -y upgrade &&\
    apt-get install -y build-essential libpq-dev nodejs &&\
    bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
