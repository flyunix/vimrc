#!/bin/bash
PWD=$(pwd)

#install .vimrc
if [ ! -e ~/.vimrc ]; then
    ln -s ${PWD}/.vimrc ~/.vimrc
fi

#install Vundle
if [ ! -e ~/.vim/bundle/Vundle.vim ];then
    mkdir -p ~/.vim/bundle/Vundle.vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    (cd ~/.vim/bundle/Vundle.vim/; git pull origin master)
fi

#PluginInstall
vim -c "PluginInstall"

#config YoucompleteMe
#YoucompeleteMe will cost some time, Be patient!
#sudo apt install cmake;
#sudo apt install python2.7-dev
(cd ~/.vim/bundle/YouCompleteMe/; ./install.py --clang-completer)
