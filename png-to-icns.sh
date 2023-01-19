#!/bin/bash

# $1 : the filename of the PNG to turn into an icon, without the .png extension

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

${SCRIPT_DIR}/ios-icon-generator.sh $1.png $1.iconset
iconutil -c icns $1.iconset
