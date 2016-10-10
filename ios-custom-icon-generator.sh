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
SIZE_WIDTH="$3"
SIZE_HEIGHT="$4"

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
    $0 srcfile dstpath size

DESCRIPTION:
    This script aim to generate ios navigation icons easier and simply.

    srcfile - The source png image. Preferably big.
    dstpath - The destination path where the icons generate to.
    size - The destination size in pixel, only one number (e.g 60)

    This script is depend on ImageMagick. So you must install ImageMagick first
    Please see http://www.imagemagick.org/script/binary-releases.php for installation instructions

AUTHOR:
    Alessandro Miliucci<lifeisfoo@gmail.com>
    Vladimir Bilyov<vladimir.bilyov@gmail.com>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 icon-big.png ~/asset_dir 100 50
EOF
}

SVG_SETTINGS="-background none -density 1200"

function _convert(){
    SRCFILE=$1
    FILEEXT=${SRCFILE##*.}
    SIZE=$2
    DSTFILE=$3

    info "Generate $DSTFILE ..."
    if [ $FILEEXT = "svg" ]; then
        convert $SVG_SETTINGS -resize $SIZE $SRCFILE $DSTFILE
    else
        convert $SRCFILE -resize $SIZE $DSTFILE
    fi
}


# Check param
if [ $# != 4 ];then
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

#info "Generate $FILENAME.png ..."
#convert "$SRC_FILE" -resize "$SIZE_WIDTH"x"$SIZE_HEIGHT" "$DST_PATH/$FILENAME.png"
_convert "$SRC_FILE" "$SIZE_WIDTH"x"$SIZE_HEIGHT" "$DST_PATH/$FILENAME.png"

#info "Generate $FILENAME@2x.png ..."
DOUBLE_WIDTH=$(($SIZE_WIDTH * 2))
DOUBLE_HEIGHT=$(($SIZE_HEIGHT * 2))
#convert "$SRC_FILE" -resize "$DOUBLE_SIZE"x"$DOUBLE_HEIGHT" "$DST_PATH/$FILENAME@2x.png"
_convert "$SRC_FILE" "$DOUBLE_WIDTH"x"$DOUBLE_HEIGHT" "$DST_PATH/$FILENAME@2x.png"

TRIPLE_WIDTH=$(($SIZE_WIDTH * 3))
TRIPLE_HEIGHT=$(($SIZE_HEIGHT * 3))
#info "Generate $FILENAME@3x.png ..."
#convert "$SRC_FILE" -resize "$TRIPLE_SIZE"x"$TRIPLE_HEIGHT" "$DST_PATH/$FILENAME@3x.png"
_convert "$SRC_FILE" "$TRIPLE_WIDTH"x"$TRIPLE_HEIGHT" "$DST_PATH/$FILENAME@3x.png"

info 'Generate Done.'
