#!/usr/bin/env bash

######################################################################
# Install Flutter SDK from Github Repo
######################################################################

sudo mkdir /opt/flutter \
&& sudo chown $USER:$USER /opt/flutter \
&& git clone -b stable --depth 1 \
  https://github.com/flutter/flutter.git \
  /opt/flutter \
&& export PATH="$PATH:/opt/flutter/bin"

