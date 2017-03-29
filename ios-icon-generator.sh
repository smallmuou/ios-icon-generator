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
XC_VERS="$3"

VERSION=2.0.0

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
    $0 srcfile dstpath xcvers

DESCRIPTION:
    This script aim to generate ios app icons easier and simply.

    srcfile - The source png image. Preferably above 1024x1024
    dstpath - The destination path where the icons generate to.
    xcvers - The xcode version you are using(optional, default is 7).

    This script is depend on ImageMagick. So you must install ImageMagick first
    You can use 'sudo brew install ImageMagick' to install it

AUTHOR:
    Pawpaw<lvyexuwenfa100@126.com>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 1024.png ~/123
EOF
}

generate_v7(){
    # Generate, refer to:https://developer.apple.com/library/ios/qa/qa1686/_index.html

    info 'Generate iTunesArtwork.png ...'
    convert "$SRC_FILE" -resize 512x512 "$DST_PATH/iTunesArtwork.png"
    info 'Generate iTunesArtwork@2x.png ...'
    convert "$SRC_FILE" -resize 1024x1024 "$DST_PATH/iTunesArtwork@2x.png"

    info 'Generate Icon-20.png ...'
    convert "$SRC_FILE" -resize 20x20 "$DST_PATH/Icon-20.png"
    info 'Generate Icon-20@2x.png ...'
    convert "$SRC_FILE" -resize 40x40 "$DST_PATH/Icon-20@2x.png"
    info 'Generate Icon-40@2x.png ...'
    convert "$SRC_FILE" -resize 60x60 "$DST_PATH/Icon-20@3x.png"

    info 'Generate Icon-29.png ...'
    convert "$SRC_FILE" -resize 29x29 "$DST_PATH/Icon-29.png"
    info 'Generate Icon-29@2x.png ...'
    convert "$SRC_FILE" -resize 58x58 "$DST_PATH/Icon-29@2x.png"
    info 'Generate Icon-29@3x.png ...'
    convert "$SRC_FILE" -resize 87x87 "$DST_PATH/Icon-29@3x.png"

    info 'Generate Icon-40.png ...'
    convert "$SRC_FILE" -resize 40x40 "$DST_PATH/Icon-40.png"
    info 'Generate Icon-40@2x.png ...'
    convert "$SRC_FILE" -resize 80x80 "$DST_PATH/Icon-40@2x.png"
    info 'Generate Icon-40@3x.png ...'
    convert "$SRC_FILE" -resize 120x120 "$DST_PATH/Icon-40@3x.png"

    info 'Generate Icon-60.png ...'
    convert "$SRC_FILE" -resize 60x60 "$DST_PATH/Icon-60.png"
    info 'Generate Icon-60@2x.png ...'
    convert "$SRC_FILE" -resize 120x120 "$DST_PATH/Icon-60@2x.png"
    info 'Generate Icon-60@3x.png ...'
    convert "$SRC_FILE" -resize 180x180 "$DST_PATH/Icon-60@3x.png"

    info 'Generate Icon-76.png ...'
    convert "$SRC_FILE" -resize 76x76 "$DST_PATH/Icon-76.png"
    info 'Generate Icon-76@2x.png ...'
    convert "$SRC_FILE" -resize 152x152 "$DST_PATH/Icon-76@2x.png"

    info 'Generate Icon-57.png ...'
    convert "$SRC_FILE" -resize 57x57 "$DST_PATH/Icon-57.png"
    info 'Generate Icon-57@2x.png ...'
    convert "$SRC_FILE" -resize 114x114 "$DST_PATH/Icon-57@2x.png"

    info 'Generate Icon-83.5@2x.png ...'
    convert "$SRC_FILE" -resize 167x167 "$DST_PATH/Icon-83.5@2x.png"

    info 'Generate Icon-72.png ...'
    convert "$SRC_FILE" -resize 72x72 "$DST_PATH/Icon-72.png"
    info 'Generate Icon-72@2x.png ...'
    convert "$SRC_FILE" -resize 144x144 "$DST_PATH/Icon-72@2x.png"

    info 'Generate Icon-50.png ...'
    convert "$SRC_FILE" -resize 50x50 "$DST_PATH/Icon-50.png"
    info 'Generate Icon-50@2x.png ...'
    convert "$SRC_FILE" -resize 100x100 "$DST_PATH/Icon-50@2x.png"
}

generate_v8(){
    # Generate, refer to:https://developer.apple.com/ios/human-interface-guidelines/graphics/app-icon/

    info 'Generating iPhone icons.'
    convert "$SRC_FILE" -resize 40x40 "$DST_PATH/iphone20@2x.png"
    convert "$SRC_FILE" -resize 60x60 "$DST_PATH/iphone20@3x.png"
    convert "$SRC_FILE" -resize 29x29 "$DST_PATH/iphone29@1x.png"
    convert "$SRC_FILE" -resize 58x58 "$DST_PATH/iphone29@2x.png"
    convert "$SRC_FILE" -resize 87x87 "$DST_PATH/iphone29@3x.png"
    convert "$SRC_FILE" -resize 80x80 "$DST_PATH/iphone40@2x.png"
    convert "$SRC_FILE" -resize 120x120 "$DST_PATH/iphone40@3x.png"
    convert "$SRC_FILE" -resize 57x57 "$DST_PATH/iphone57@1x.png"
    convert "$SRC_FILE" -resize 114x114 "$DST_PATH/iphone57@2x.png"
    convert "$SRC_FILE" -resize 120x120 "$DST_PATH/iphone60@2x.png"
    convert "$SRC_FILE" -resize 180x180 "$DST_PATH/iphone60@3x.png"

    info 'Generating iPad icons.'
    convert "$SRC_FILE" -resize 20x20 "$DST_PATH/ipad20@1x.png"
    convert "$SRC_FILE" -resize 40x40 "$DST_PATH/ipad20@2x.png"
    convert "$SRC_FILE" -resize 29x29 "$DST_PATH/ipad29@1x.png"
    convert "$SRC_FILE" -resize 58x58 "$DST_PATH/ipad29@2x.png"
    convert "$SRC_FILE" -resize 40x40 "$DST_PATH/ipad40@1x.png"
    convert "$SRC_FILE" -resize 80x80 "$DST_PATH/ipad40@2x.png"
    convert "$SRC_FILE" -resize 50x50 "$DST_PATH/ipad50@1x.png"
    convert "$SRC_FILE" -resize 100x100 "$DST_PATH/ipad50@2x.png"
    convert "$SRC_FILE" -resize 72x72 "$DST_PATH/ipad72@1x.png"
    convert "$SRC_FILE" -resize 144x144 "$DST_PATH/ipad72@2x.png"
    convert "$SRC_FILE" -resize 76x76 "$DST_PATH/ipad76@1x.png"
    convert "$SRC_FILE" -resize 152x152 "$DST_PATH/ipad76@2x.png"
    convert "$SRC_FILE" -resize 167x167 "$DST_PATH/ipad83.5@2x.png"

    info 'Generating watch icons.'
    convert "$SRC_FILE" -resize 48x48 "$DST_PATH/watch-38mm-notification@2x.png"
    convert "$SRC_FILE" -resize 110x110 "$DST_PATH/watch-42mm-notification@2x.png"
    convert "$SRC_FILE" -resize 58x58 "$DST_PATH/watch29-companion@2x.png"
    convert "$SRC_FILE" -resize 87x87 "$DST_PATH/watch29-companion@3x.png"
    convert "$SRC_FILE" -resize 80x80 "$DST_PATH/watch-38mm-launcher@2x.png"
    convert "$SRC_FILE" -resize 88x88 "$DST_PATH/watch-42mm-longLook@2x.png"
    convert "$SRC_FILE" -resize 172x172 "$DST_PATH/watch-38mm-quickLook@2x.png"
    convert "$SRC_FILE" -resize 196x196 "$DST_PATH/watch-42mm-quickLook@2x.png"

    info 'Coping Contents.json ...'
    cp "Contents.json" "$DST_PATH/Contents.json"
}

# Check ImageMagick
command -v convert >/dev/null 2>&1 || { error >&2 "The ImageMagick is not installed. Please use brew to install it first."; exit -1; }

# Check param
if [ $# != 2 ] && [ $# != 3 ];then
    usage
    exit -1
fi

# Check dst path whether exist.
if [ ! -d "$DST_PATH" ];then
    mkdir -p "$DST_PATH"
fi

if [ "$XC_VERS" == "8" ]; then
    generate_v8
else
    generate_v7
fi

info 'Generate Done.'
