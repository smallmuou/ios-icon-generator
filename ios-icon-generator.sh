#!/bin/sh
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

SRC_FILE=$1
DST_PATH=$2

VERSION=0.1

function usage() {
    echo "Usage: $0 srcfile dstpath"
    exit -1
}

# Check param
if [ $# != 2 ];then
    usage
fi

# Check dst path whether exist.
if [ ! -d "$DST_PATH" ];then
    mkdir -p "$DST_PATH"
fi

# Generate, refer to:https://developer.apple.com/library/ios/qa/qa1686/_index.html

echo 'Generate iTunesArtwork.png ...'
convert $SRC_FILE -resize 512x512 $DST_PATH/iTunesArtwork.png
echo 'Generate iTunesArtwork@2x.png ...'
convert $SRC_FILE -resize 1024x1024 $DST_PATH/iTunesArtwork@2x.png

echo 'Generate Icon-Small.png ...'
convert $SRC_FILE -resize 29x29 $DST_PATH/Icon-Small.png
echo 'Generate Icon-Small@2x.png ...'
convert $SRC_FILE -resize 58x58 $DST_PATH/Icon-Small@2x.png
echo 'Generate Icon-Small@3x.png ...'
convert $SRC_FILE -resize 87x87 $DST_PATH/Icon-Small@3x.png

echo 'Generate Icon-Small-40.png ...'
convert $SRC_FILE -resize 40x40 $DST_PATH/Icon-Small-40.png
echo 'Generate Icon-Small-40@2x.png ...'
convert $SRC_FILE -resize 80x80 $DST_PATH/Icon-Small-40@2x.png
echo 'Generate Icon-Small-40@3x.png ...'
convert $SRC_FILE -resize 120x120 $DST_PATH/Icon-Small-40@3x.png

echo 'Generate Icon-60.png ...'
convert $SRC_FILE -resize 60x60 $DST_PATH/Icon-60.png
echo 'Generate Icon-60@2x.png ...'
convert $SRC_FILE -resize 120x120 $DST_PATH/Icon-60@2x.png
echo 'Generate Icon-60@3x.png ...'
convert $SRC_FILE -resize 180x180 $DST_PATH/Icon-60@3x.png

echo 'Generate Icon-76.png ...'
convert $SRC_FILE -resize 76x76 $DST_PATH/Icon-76.png
echo 'Generate Icon-76@2x.png ...'
convert $SRC_FILE -resize 152x152 $DST_PATH/Icon-76@2x.png

echo 'Generate Icon.png ...'
convert $SRC_FILE -resize 57x57 $DST_PATH/Icon.png
echo 'Generate Icon@2x.png ...'
convert $SRC_FILE -resize 114x114 $DST_PATH/Icon@2x.png

echo 'Generate Icon-72.png ...'
convert $SRC_FILE -resize 72x72 $DST_PATH/Icon-72.png
echo 'Generate Icon-72@2x.png ...'
convert $SRC_FILE -resize 144x144 $DST_PATH/Icon-72@2x.png

echo 'Generate Icon-Small-50.png ...'
convert $SRC_FILE -resize 50x50 $DST_PATH/Icon-Small-50.png
echo 'Generate Icon-Small-50@2x.png ...'
convert $SRC_FILE -resize 100x100 $DST_PATH/Icon-Small-50@2x.png

echo 'Generate Done.'
