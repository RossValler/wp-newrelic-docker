FROM wordpress:4.5.1-apache

# Install NewRelic
RUN apt-get update && \
    apt-get -yq install wget && \
    wget -O - https://download.newrelic.com/548C16BF.gpg | apt-key add - && \
    echo "deb http://apt.newrelic.com/debian/ newrelic non-free" > /etc/apt/sources.list.d/newrelic.list

# Install NewRelic PHP module
RUN apt-get update && \
    apt-get -yq install newrelic-php5

ADD run.sh /run.sh

ENTRYPOINT ["/run.sh"]
CMD ["apache2-foreground"]