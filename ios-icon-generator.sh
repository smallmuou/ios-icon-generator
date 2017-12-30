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

VERSION=1.1.0

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

AUTHOR:
    Pawpaw<lvyexuwenfa100@126.com>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 1024.png ~/123
EOF
}

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

info 'Generate iTunesArtwork.png ...'
sips "$SRC_FILE" -Z 512 --out "$DST_PATH/iTunesArtwork.png"
info 'Generate iTunesArtwork@2x.png ...'
sips "$SRC_FILE" -Z 1024 --out "$DST_PATH/iTunesArtwork@2x.png"

info 'Generate Icon-20.png ...'
sips "$SRC_FILE" -Z 20 --out "$DST_PATH/Icon-20.png"
info 'Generate Icon-20@2x.png ...'
sips "$SRC_FILE" -Z 40 --out "$DST_PATH/Icon-20@2x.png"
info 'Generate Icon-40@2x.png ...'
sips "$SRC_FILE" -Z 60 --out "$DST_PATH/Icon-20@3x.png"

info 'Generate Icon-29.png ...'
sips "$SRC_FILE" -Z 29 --out "$DST_PATH/Icon-29.png"
info 'Generate Icon-29@2x.png ...'
sips "$SRC_FILE" -Z 58 --out "$DST_PATH/Icon-29@2x.png"
info 'Generate Icon-29@3x.png ...'
sips "$SRC_FILE" -Z 87 --out "$DST_PATH/Icon-29@3x.png"

info 'Generate Icon-40.png ...'
sips "$SRC_FILE" -Z 40 --out "$DST_PATH/Icon-40.png"
info 'Generate Icon-40@2x.png ...'
sips "$SRC_FILE" -Z 80 --out "$DST_PATH/Icon-40@2x.png"
info 'Generate Icon-40@3x.png ...'
sips "$SRC_FILE" -Z 120 --out "$DST_PATH/Icon-40@3x.png"

info 'Generate Icon-60.png ...'
sips "$SRC_FILE" -Z 60 --out "$DST_PATH/Icon-60.png"
info 'Generate Icon-60@2x.png ...'
sips "$SRC_FILE" -Z 120 --out "$DST_PATH/Icon-60@2x.png"
info 'Generate Icon-60@3x.png ...'
sips "$SRC_FILE" -Z 180 --out "$DST_PATH/Icon-60@3x.png"

info 'Generate Icon-76.png ...'
sips "$SRC_FILE" -Z 76 --out "$DST_PATH/Icon-76.png"
info 'Generate Icon-76@2x.png ...'
sips "$SRC_FILE" -Z 152 --out "$DST_PATH/Icon-76@2x.png"

info 'Generate Icon-57.png ...'
sips "$SRC_FILE" -Z 57 --out "$DST_PATH/Icon-57.png"
info 'Generate Icon-57@2x.png ...'
sips "$SRC_FILE" -Z 114 --out "$DST_PATH/Icon-57@2x.png"

info 'Generate Icon-83.5@2x.png ...'
sips "$SRC_FILE" -Z 167 --out "$DST_PATH/Icon-83.5@2x.png"

info 'Generate Icon-72.png ...'
sips "$SRC_FILE" -Z 72 --out "$DST_PATH/Icon-72.png"
info 'Generate Icon-72@2x.png ...'
sips "$SRC_FILE" -Z 144 --out "$DST_PATH/Icon-72@2x.png"

info 'Generate Icon-50.png ...'
sips "$SRC_FILE" -Z 50 --out "$DST_PATH/Icon-50.png"
info 'Generate Icon-50@2x.png ...'
sips "$SRC_FILE" -Z 100 --out "$DST_PATH/Icon-50@2x.png"

info 'Generate Done.'
