FROM ruby:2.4
MAINTAINER etienne@scalingo.com

RUN apt-get update
RUN apt-get install -y nodejs locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
  echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
  dpkg-reconfigure --frontend=noninteractive locales && \
  update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

COPY Gemfile Gemfile.lock /usr/src/app/
WORKDIR /usr/src/app

ENV BUNDLE_APP_CONFIG /usr/src/app/.bundle
ENV BUNDLE_PATH /usr/src/app/vendor/bundle

WORKDIR /usr/src/app
ENTRYPOINT ["/usr/src/app/bin/docker-entrypoint.sh"]
