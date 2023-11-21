#!/bin/bash

sudo apt-get install vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

scp ./vimrc ~/.vim/vimrc

#Install plugs
vim -c 'PlugInstall' +qa

cd ~/.vim/plugged/YouCompleteMe
python3 install.py --all --verbose 

echo "Vim is done"
