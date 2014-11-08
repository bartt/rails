FROM bartt/ruby:2.1.3

RUN apt-get install -y nodejs postgresql-client sqlite3 --no-install-recommends 

ENV RAILS_VERSION 3.2.17

RUN gem install rails --version "$RAILS_VERSION"
