#!/bin/bash
base=$(dirname $0)

mkdir -p ~/.config/waybar
cp $base/config ~/.config/waybar/
cp $base/style.css ~/.config/waybar
git clone https://github.com/catppuccin/waybar ~/.config/waybar/CatppuccinTheme
