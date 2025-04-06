FROM ruby:latest

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninter active
ENV LANG C
ENV TZ Asia/Tokyo

WORKDIR /app/service

COPY Gemfile* /app/service/

RUN apt -y update && apt -y upgrade &&\
    apt install -y build-essential libpq-dev nodejs &&\
    bundle install &&\
    rm -rf /var/lib/apt/lists/*

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
