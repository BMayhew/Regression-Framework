ARG RUBY_VERSION=2.6.2
FROM ruby:${RUBY_VERSION}

ENV DEBIAN_FRONTEND noninteractive
ENV CHROMIUM_DRIVER_VERSION 77.0.3865.40
ENV CHROME_VERSION amd64 77.0.3865.90-1
ENV HEADLESS true

# Install dependencies & Chrome
RUN apt-get update && apt-get -y --no-install-recommends install zlib1g-dev liblzma-dev wget xvfb unzip libgconf2-4 libnss3 nodejs \
 && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -  \
 && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
 && apt-get update && apt-get -y --no-install-recommends install google-chrome-stable \
 && rm -rf /var/lib/apt/lists/*

# Install Chrome driver
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/$CHROMIUM_DRIVER_VERSION/chromedriver_linux64.zip \
    && unzip /tmp/chromedriver.zip chromedriver -d /usr/bin/ \
    && rm /tmp/chromedriver.zip \
    && chmod ugo+rx /usr/bin/chromedriver \
    && apt-mark hold google-chrome-stable

# Pull Test Automation from git and bundle
RUN git clone https://github.com/bmayhew/Regression-Framework.git \
    && cd Regression-Framework \
    && bundle install

RUN google-chrome-stable --no-sandbox --headless

# RUN mkdir /data
# VOLUME /data
# ENV HOME=/data DEBUG_ADDRESS=0.0.0.0 DEBUG_PORT=9222


ADD docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]