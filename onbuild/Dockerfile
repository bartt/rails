FROM bartt/ruby:2.1.3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1 
  
RUN mkdir -p /ror/
WORKDIR /ror/

ONBUILD COPY Gemfile /ror/
ONBUILD COPY Gemfile.lock /ror/
ONBUILD RUN bundle install
ONBUILD COPY . /ror/

RUN apt-get install -y nodejs postgresql-client libpq-dev sqlite3 --no-install-recommends 

EXPOSE 3000
CMD ["rails", "server"]
