#!/bin/bash
#

Base="vi vim neovim sudo dhcpcd"
# echo username ALL:(ALL:ALL) >> sudoer file
Audio="pipewire pipewire-audio pipewire-pulse pavucontrol"
DE="hyprland hyprpaper kitty xdg-desktop-portal-hyprland wl-clipboard "
DEAur="rofi-lbonn-wayland nwg-look"
Fonts="adobe-source-han-sans-tw-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts"
IME="fcitx5 fcitx5-qt fcitx5-gtk fcitx5-configtool fcitx5-chewing"


Peripheral="linux-headers"
PeripheralAur="openrazer-meta polychromatics"
# add user to plugdev group

Programs="btop firefox"
ProgramAur="anki"

wget -q --spider http://google.com

if [ $? -eq 1 ]; then
  echo "Connection unavaliable. Aborting."
  exit 1
fi


# yay command: yay --answerclean None --answerdiff None --removemake
