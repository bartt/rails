FROM bartt/ruby:2.1.3

RUN apt-get install -y nodejs postgresql-client libpq-dev sqlite3 --no-install-recommends 

ENV RAILS_VERSION 3.2.17

RUN mv /usr/local/bin/rdoc /usr/local/bin/rdoc.orig && mv /usr/local/bin/ri /usr/local/bin/ri.orig && gem install rails --version "$RAILS_VERSION"
