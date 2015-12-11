## -*- docker-image-name: "xingfuryda/tilemill-docker:latest" -*-

##
# The Tilemill Docker Server
#
# This creates an image with tilemill hosted as a nodejs
# web app for remote use

FROM phusion/baseimage:0.9.17
MAINTAINER xingfuryda

# install packages
RUN apt-get update -y
RUN apt-get install -y nodejs-legacy npm build-essential g++ git ttf-unifont ttf-dejavu fonts-freefont-otf

# build tilemill
RUN mkdir /var/www && cd /var/www && git clone https://github.com/mapbox/tilemill.git && cd tilemill && npm install

# force qs version 5.2.0
RUN cd /var/www/tilemill/node_modules/connect && rm -rf node_modules && sed 's/>= 0.4.0/5.2.0/' package.json | tee package.json && npm install

# Create a `tilemill` `runit` service
ADD tilemill /etc/sv/tilemill
RUN chmod +x /etc/sv/tilemill/run
RUN update-service --add /etc/sv/tilemill

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose the webserver port
EXPOSE 20009

# We need the volume for importing data from
VOLUME ["/data"]

# Add the README
ADD README.md /usr/local/share/doc/

# Add the help file
RUN mkdir -p /usr/local/share/doc/run
ADD help.txt /usr/local/share/doc/run/help.txt

# Add the entrypoint
ADD run.sh /usr/local/sbin/run
RUN chmod +x /usr/local/sbin/run
ENTRYPOINT ["/sbin/my_init", "--", "/usr/local/sbin/run"]

# Default to showing the usage text
CMD ["help"]
