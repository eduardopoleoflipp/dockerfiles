FROM ruby:3.2.2-alpine

ARG BASE_CONTAINER_VERSION
ARG LAST_BUILD_DATE

RUN apk update && apk upgrade
RUN apk --update add curl git openssh-client openssl nodejs aws-cli mysql mysql-client jemalloc-dev

ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so

ENV BASE_CONTAINER_VERSION $BASE_CONTAINER_VERSION
ENV LAST_BUILD_DATE $LAST_BUILD_DATE

RUN mkdir -p /var/certs

# COPY platform-param-decrypt_linux /usr/local/bin/platform-param-decrypt_linux

# Update rubygems to the latest stable version
RUN gem update --system 3.4.7

# Rubygems config for Artifactory
# COPY .gemrc /root/.gemrc

# Bundler config for Artifactory
# COPY bundleConfig /root/.bundle/config

# NPM credential for Artifactory (some Rails apps require Node)
# COPY .npmrc /root/.npmrc

# COPY platform-container-startup.sh /var/scripts/platform-container-startup.sh
# RUN chmod +x /var/scripts/platform-container-startup.sh

# ENTRYPOINT ["/var/scripts/platform-container-startup.sh"]
