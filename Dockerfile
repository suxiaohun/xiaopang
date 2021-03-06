FROM xiaopang.base:v0.0.9

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

WORKDIR /var/www/xiaopang

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["bundle","exec", "unicorn","-c","config/unicorn.rb","-E","production"]