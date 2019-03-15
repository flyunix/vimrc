#!/bin/bash
PWD=$(pwd)

#install .vimrc
ln -s ${PWD}/.vimrc ~/.vimrc

#install Vundle
mkdir ~/.vim/bundle
cp -af ${PWD}/Vundle.vim ~/.vim/bundle

#PluginInstall
vim -c "PluginInstall"
