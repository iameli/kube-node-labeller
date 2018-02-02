#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

run () {
  echo "Running labeller..."
  region=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed -e "s/.$//")
  localHostname=$(curl -s http://169.254.169.254/latest/meta-data/local-hostname)

  tags="$( \
    aws ec2 describe-tags \
    --region $region \
    --filters "Name=resource-id,Values=$(curl --silent http://169.254.169.254/latest/meta-data/instance-id)" | \
    jq -c '.Tags[]'
  )"

  for tag in $tags; do
    # Keys may not contain colons, replace with dashes
    key="$(echo $tag | jq -r '.Key' | sed s/:/-/g | sed s!/!-!)"    
    # Values may not be more than 63 chars
    value="$(echo $tag | jq -r '.Value' | cut -c 1-63 | sed s/:/-/g | sed s/\\\//-/g)"
    patch="$(jq -n ".metadata.labels[\"$key\"] = \"$value\"")"
    kubectl patch node "$localHostname" -p "$patch"
  done
}

while true; do
  run
  sleep 60
done
