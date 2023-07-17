#!/bin/bash
base="$(dirname $0)"
themeDir="/usr/share/rofi/themes"
baseURL="https://raw.githubusercontent.com/newmanls/rofi-themes-collection/master/themes/"


sudo wget -P $themeDir $baseURL/rounded-common.rasi
sudo wget -P $themeDir $baseURL/rounded-nord-dark.rasi
sudo wget -P $themeDir https://raw.githubusercontent.com/newmanls/rofi-themes-collection/master/LICENSE 

mkdir -p ~/.config/rofi
cp $base/config.rasi ~/.config/rofi/
