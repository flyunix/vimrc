#!/bin/bash
PWD=$(pwd)

#install .vimrc
ln -s ${PWD}/.vimrc ~/.vimrc

#install Vundle
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle

#PluginInstall
vim -c "PluginInstall"
