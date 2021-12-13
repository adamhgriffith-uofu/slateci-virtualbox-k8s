#!/bin/bash

# Enable strict mode:
set -euo pipefail

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~ Federate with SLATE                                                             ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

clustername=test-vagrant-$(date +%s )
groupname="XXXX"
orgname="XXXX"

echo "Joining the SLATE federation..."
slate cluster create ${clustername} --group ${groupname} --org ${orgname} -y

echo "Updating the SLATE cluster location to SLC..."
slate cluster update ${clustername} --location 40.76078, -111.89105
