#!/bin/bash
git submodule add -f git://github.com/rodjek/vim-puppet.git .vim/bundle/puppet
git submodule add -f https://github.com/w0rp/ale .
git submodule add -f https://github.com/w0rp/ale ale
git submodule add -f https://github.com/pearofducks/ansible-vim ansible-vim
git submodule add -f https://github.com/editorconfig/editorconfig-vim editorconfig-vim
git submodule add -f https://github.com/Yggdroot/indentLine indentLine
git submodule add -f https://github.com/maximbaz/lightline-ale lightline.ale
git submodule add -f https://github.com/maximbaz/lightline-ale lightline-ale
git submodule add -f https://github.com/itchyny/lightline.vim lightline-vim
git submodule add -f https://github.com/godlygeek/tabular tabular
git submodule add -f https://github.com/ap/vim-buftabline vim-buftabline
git submodule add -f https://github.com/itchyny/vim-gitbranch vim-gitbranch
git submodule add -f https://github.com/Valloric/YouCompleteMe youcompleteme
for i in *; do
  (cd $i; git submodule update --init --recursive)
done