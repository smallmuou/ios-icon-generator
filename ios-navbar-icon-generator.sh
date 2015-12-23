#!/bin/bash
#
# Copyright (C) 2015 Alessandro Miliucci<lifeisfoo@gmail.com>
# 
# Based on https://github.com/smallmuou/ios-icon-generator/blob/master/ios-icon-generator.sh
# from Wenva <lvyexuwenfa100@126.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished
# to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -e

SRC_FILE="$1"
DST_PATH="$2"

VERSION=1.0.0

info() {
     local green="\033[1;32m"
     local normal="\033[0m"
     echo -e "[${green}INFO${normal}] $1"
}

error() {
     local red="\033[1;31m"
     local normal="\033[0m"
     echo -e "[${red}ERROR${normal}] $1"
}

usage() {
cat << EOF
VERSION: $VERSION
USAGE:
    $0 srcfile dstpath

DESCRIPTION:
    This script aim to generate ios navigation icons easier and simply.

    srcfile - The source png image. Preferably above 66x66
    dstpath - The destination path where the icons generate to.

    This script is depend on ImageMagick. So you must install ImageMagick first
    You can use 'sudo brew install ImageMagick' to install it

AUTHOR:
    Alessandro Miliucci<lifeisfoo@gmail.com>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 icon-big.png ~/asset_dir
EOF
}

# Check ImageMagick
command -v convert >/dev/null 2>&1 || { error >&2 "The ImageMagick is not installed. Please use brew to install it first."; exit -1; }

# Check param
if [ $# != 2 ];then
    usage
    exit -1
fi

# Check dst path whether exist.
if [ ! -d "$DST_PATH" ];then
    mkdir -p "$DST_PATH"
fi

# Generate, refer to:https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/IconMatrix.html#//apple_ref/doc/uid/TP40006556-CH27-SW2

FILENAME=$(basename "$SRC_FILE")
#extension="${filename##*.}"
FILENAME="${FILENAME%.*}"
OUT_FILENAME="$FILENAME.png"

info "Generate $FILENAME.png ..."
convert "$SRC_FILE" -resize 22x22 "$DST_PATH/$FILENAME.png"
info "Generate $FILENAME@2x.png ..."
convert "$SRC_FILE" -resize 44x44 "$DST_PATH/$FILENAME@2x.png"
info "Generate $FILENAME@3x.png ..."
convert "$SRC_FILE" -resize 66x66 "$DST_PATH/$FILENAME@3x.png"

info 'Generate Done.'
