#!/bin/sh
#
scriptDir=$(dirname $0)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim/UltiSnips
cp $scriptDir/init.vim ~/.config/nvim/init.vim

cp -r $scriptDir/UltiSnips ~/.config/nvim
