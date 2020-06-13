FROM ruby:2.6.0

# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  nodejs yarn build-essential libpq-dev imagemagick git-all nano
# install bundler
RUN gem install bundler
# default path
ENV INSTALL_PATH /challengebackend
# create dir
RUN mkdir -p $INSTALL_PATH
# setup default path
WORKDIR $INSTALL_PATH
# create Gemfile to container
COPY Gemfile ./
# path Gems
ENV BUNDLE_PATH /gems
# copy everything to to container
COPY . .