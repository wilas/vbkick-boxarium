#!/bin/bash
set -e -E -u -o pipefail; shopt -s failglob;

if [[ ! -f "/etc/apt/sources.list.d/cfengine-community.list" ]]; then
    #wget -qO- http://cfengine.com/pub/gpg.key | apt-key add -
    wget -qO- https://s3.amazonaws.com/cfengine.package-repos/pub/gpg.key | apt-key add -
    echo "deb http://cfengine.com/pub/apt/packages stable main" > /etc/apt/sources.list.d/cfengine-community.list
    apt-get -y update
fi
apt-get install -y cfengine-community
