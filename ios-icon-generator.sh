#!/bin/bash
#
# Copyright (C) 2014 Wenva <lvyexuwenfa100@126.com>
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

AI_SETTINGS="-antialias -background transparent -density 600"

VERSION=1.0.0

SIZES=(
    "512x512:iTunesArtwork.png"
    "1024x1024:iTunesArtwork@2x.png"

    "29x29:Icon-Small.png"
    "58x58:Icon-Small@2x.png"
    "87x87:Icon-Small@3x.png"

    "40x40:Icon-Small-40.png"
    "80x80:Icon-Small-40@2x.png"
    "120x120:Icon-Small-40@3x.png"

    "60x60:Icon-60.png"
    "120x120:Icon-60@2x.png"
    "180x180:Icon-60@3x.png"

    "76x76:Icon-76.png"
    "152x152:Icon-76@2x.png"

    "167x167:Icon-83.5@2x.png"

    "57x57:Icon.png"
    "114x114:Icon@2x.png"

    "72x72:Icon-72.png"
    "144x144:Icon-72@2x.png"

    "50x50:Icon-Small-50.png"
    "100x100:Icon-Small-50@2x.png"
)

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
    This script aim to generate ios app icons easier and simply.

    srcfile - The source png image. Preferably above 1024x1024
    dstpath - The destination path where the icons generate to.

    This script is depend on ImageMagick. So you must install ImageMagick first
    You can use 'sudo brew install ImageMagick' to install it

AUTHOR:
    Pawpaw<lvyexuwenfa100@126.com>
    Vladimir<vladimir.bilyov@gmail.com>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 1024.ai ~/123
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

# Generate, refer to:https://developer.apple.com/library/ios/qa/qa1686/_index.html

ext=${SRC_FILE##*.}

for size in "${SIZES[@]}" ; do
    ICON_SIZE=${size%%:*}
    ICON_FILE=${size#*:}

    info 'Generate $ICON_FILE ...'
    if [ "$ext" = "ai" ]; then
        convert $AI_SETTINGS -resize $ICON_SIZE "$SRC_FILE" "$DST_PATH/$ICON_FILE"
    else
        convert "$SRC_FILE" -resize $ICON_SIZE "$DST_PATH/$ICON_FILE"
    fi
done

info 'Generate Done.'
