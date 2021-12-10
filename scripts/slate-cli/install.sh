#!/bin/bash

# Enable strict mode:
set -euo pipefail

cd /tmp
echo "Downloading the SLATE command line interface..."
curl -LO https://jenkins.slateci.io/artifacts/client/slate-linux.tar.gz
curl -LO https://jenkins.slateci.io/artifacts/client/slate-linux.sha256
sha256sum -c slate-linux.sha256 || exit 1

echo "Installing..."
tar xzvf slate-linux.tar.gz
mv slate /usr/bin/slate

echo "Cleaning up..."
rm slate-linux.tar.gz slate-linux.sha256

# Finally:
echo "SLATE CLI installed successfully!"