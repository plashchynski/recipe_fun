FROM ruby:latest

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

ENV RAILS_ENV=production

RUN rails assets:precompile

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
