FROM ruby:2.4.1-stretch

# Install packages needed for application,
# then remove apt-get feteched lists to make image size small.
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    nodejs \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Install bundler to 1.17.3 (To match current use)
ENV BUNDLER_VERSION=1.17.3
RUN gem install bundler -v 1.17.3

# Setup application working dir
ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Copy server code into container, especially Gemfile
COPY Gemfile .

# Install gems and remove unused gems
RUN bundle install

CMD ["bundle", "exec", "rails", "console"]
