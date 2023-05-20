FROM ruby:3.1.2

ARG RAILS_ENV
ENV RAILS_ENV=${RAILS_ENV}

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set up working directory
RUN mkdir /myapp
WORKDIR /myapp

# Install gems
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN if [ "$RAILS_ENV" = "production" ]; then bundle install --without development test; else bundle install; fi

# Copy application files
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0", "-e" ,"$RAILS_ENV"]
