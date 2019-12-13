ARG RUBY_VERSION=2.6
FROM ruby:${RUBY_VERSION}

ENV DEBIAN_FRONTEND noninteractive
# https://www.ubuntuupdates.org/pm/google-chrome-stable
ENV CHROMIUM_DRIVER_VERSION 79.0.3945.36
# https://chromedriver.chromium.org/
ENV CHROME_VERSION 79.0.3945.79-1
ENV HEADLESS true

# Install dependencies & Chrome
RUN apt-get update && apt-get -y --no-install-recommends install zlib1g-dev liblzma-dev wget xvfb unzip libnss3 nodejs \
 && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -  \
 && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
 && apt-get update && apt-get -y --no-install-recommends install google-chrome-stable=$CHROME_VERSION \
 && rm -rf /var/lib/apt/lists/*

# Install Chrome driver
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/$CHROMIUM_DRIVER_VERSION/chromedriver_linux64.zip \
    && unzip /tmp/chromedriver.zip chromedriver -d /usr/bin/ \
    && rm /tmp/chromedriver.zip \
    && chmod ugo+rx /usr/bin/chromedriver

ADD ./docker/docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]