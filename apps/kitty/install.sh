#!/bin/bash

themeRepo="https://github.com/davidmathers/tokyo-night-kitty-theme"
themeConf="tokyo-night-kitty.conf"

mkdir -p ~/.config/kitty
cp /usr/share/doc/kitty/kitty.conf ~/.config/kitty/
git clone $themeRepo ~/.config/kitty/theme
echo "include ./theme/$themeConf" >> ~/.config/kitty/kitty.conf
