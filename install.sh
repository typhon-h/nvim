#!/bin/bash

cd $HOME
git clone git@github.com:typhon-h/.dotfiles.git


# Install required packages
sudo apt-get -y --ignore-missing install $(< .dotfiles/packages.list)


# Starship
curl -sS https://starship.rs/install.sh | sh -s -- --yes


# Kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh -s -- launch=n


# Nerd Font
curl -L -o ~/.local/share/fonts/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip ~/.local/share/fonts/JetBrainsMono.zip -d ~/.local/share/fonts/
rm ~/.local/share/fonts/JetBrainsMono.zip
fc-cache -fv


# Setup config symlinks
ln -sf ${pwd}/.stow-global-ignore $HOME/.stow-global-ignore
stow -v -R --adopt -t $HOME */
git restore .
