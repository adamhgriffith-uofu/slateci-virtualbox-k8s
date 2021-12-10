#!/bin/bash

# Enable strict mode:
set -euo pipefail

echo "Loading environmental YML..."
source "/vagrant/scripts/yml.sh"
create_variables "/vagrant/envs/${SLATE_ENV}.yml" "conf_"
echo "Following variables now loaded..."
declare -a | grep " conf_.*"

echo "Setting the SLATE API endpoint..."
echo "export SLATE_API_ENDPOINT=\"https://${conf_slate_api_hostname}:${conf_slate_api_port}\"" >> "/home/vagrant/.bashrc"

echo "Setting the SLATE access token..."
slatepath="/home/vagrant/.slate"
mkdir -p -m 0700 ${slatepath}
cp /vagrant/secrets/tokens/cli-access "${slatepath}/token"
chmod 0600 "${slatepath}/token"
chown vagrant:vagrant -R "${slatepath}"

# Finally:
echo "SLATE access token successfully stored!"
