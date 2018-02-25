#!/bin/bash

#
# This script is intended to setup some variables that binds together
# the yocto layer structure needed to build an 'shout' image.
# It can be execute either before or after the source-oe-env script,
# but it must be extecuted before trying to build the intended image.

export YOCTO_HOME=/home/malmbergoe/Development/yocto_test
echo "YOCTO_HOME is now set to '$YOCTO_HOME'"

echo "please ensure that dependent layers exists..."

echo "adding YOCTO_HOME to BB_ENV_EXTRAWHITE to make it available for bitbake"
export BB_ENV_EXTRAWHITE="$BB_ENV_EXTRAWHITE YOCTO_HOME"


