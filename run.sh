#!/bin/bash

# Setup environment variables for initializing New Relic
NR_INSTALL_SILENT=1
NR_LICENSE_KEY="${NR_LICENSE_KEY}"
NR_APP_NAME="${NR_APP_NAME}"

# Run NR install
newrelic-install install

# Update the application name
sed -i "s/newrelic.appname = \"PHP Application\"/newrelic.appname = \"${NR_APP_NAME}\"/" /usr/local/etc/php/conf.d/newrelic.ini
sed -i "s/newrelic.license = \"REPLACE_WITH_REAL_KEY\"/newrelic.license = \"${NR_LICENSE_KEY}\"/" /usr/local/etc/php/conf.d/newrelic.ini

exec /entrypoint.sh "$@"
