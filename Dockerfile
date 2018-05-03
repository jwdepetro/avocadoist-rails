# Base container off ruby
FROM ruby

# Install baseline dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Create the working directory
RUN mkdir /avocadoist

# Define the working directory
WORKDIR /avocadoist

# Copy gem files over
COPY Gemfile /avocadoist/Gemfile
COPY Gemfile.lock /avocadoist/Gemfile.lock

# Install gems
RUN bundle install

# Copy remaining files over
COPY . /avocadoist