#!/bin/bash

# Enable strict mode:
set -euo pipefail

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~ Configure SLATE CLI Access                                                      ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "Loading environmental YML..."
source "/vagrant/scripts/yml.sh"
create_variables "/vagrant/envs/${SLATE_ENV}.yml" "conf_"
echo "Following variables now loaded..."
declare -a | grep " conf_.*"

echo "Setting the SLATE API endpoint..."
echo "export SLATE_API_ENDPOINT=\"https://${conf_slate_api_hostname}:${conf_slate_api_port}\"" >> "$HOME/.bashrc"

echo "Setting the SLATE access token..."
slatepath="$HOME/.slate"
mkdir -p -m 0700 ${slatepath}
cp /vagrant/secrets/tokens/slate-cli "${slatepath}/token"
chmod 0600 "${slatepath}/token"

# Finally:
echo "SLATE access token successfully stored!"
