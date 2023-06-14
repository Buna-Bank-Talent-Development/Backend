FROM ruby:3.1.2

ARG RAILS_ENV
ENV RAILS_ENV=${RAILS_ENV}

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set up working directory
RUN mkdir /app
WORKDIR /app

# Install gems
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle config set --local without 'development test'
RUN bundle install --jobs 20 --retry 5

# Copy application files
COPY . /app

# Add a script to be executed every time the container starts.
COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0", "-e" ,"$RAILS_ENV"]
