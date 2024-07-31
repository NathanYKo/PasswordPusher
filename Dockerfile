FROM ruby:3.2.0

WORKDIR /app

RUN apt-get update && apt-get install -y nodejs npm
RUN npm install -g yarn

COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install

COPY . .

RUN yarn install
RUN RAILS_ENV=production SECRET_KEY_BASE=dummy bundle exec rails assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0"]
