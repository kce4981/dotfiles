#!/bin/sh

base=$(dirname $0)

mkdir -p ~/.config/hypr
cp $base/*.conf ~/.config/hypr/
