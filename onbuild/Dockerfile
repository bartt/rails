FROM bartt/ruby:2.1.3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1 && \
  mkdir -p /ror

ONBUILD COPY Gemfile /ror
ONBUILD COPY Gemfile.lock /ror

ONBUILD RUN bundle install

ONBUILD COPY . /ror

RUN apt-get install -y nodejs postgresql-client sqlite3 --no-install-recommends 

WORKDIR /ror
EXPOSE 3000
CMD ["rails", "server"]
