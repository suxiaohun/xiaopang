FROM xiaopang.base:0.0.2

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /var/www/xiaopang

COPY . .

RUN bundle install &&  bundle exec rake assets:precompile

CMD ["unicorn","-c","config/unicorn.rb","-E","production"]