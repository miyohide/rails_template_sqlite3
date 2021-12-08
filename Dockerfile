FROM ruby:3.0.3

WORKDIR /app

# Using Node.js v16.x(LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -

# Add packages
RUN apt-get update && apt-get install -y \
      git \
      nodejs \
      sqlite3 \
      redis-server \
      vim

# Add yarnpkg for assets:precompile
RUN npm install -g yarn
