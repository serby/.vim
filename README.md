# Paul Serby's Vim setup

This is my Vim setup. Please feel free to use it.

I've based this on the excellent [Vimcast](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
) by [Drew Neil](http://drewneil.com/).

# Installation

     git clone git@github.com:PabloSerbo/.vim.git

## Create symlinks

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

## Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update
