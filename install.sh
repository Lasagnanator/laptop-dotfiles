#! /bin/bash
#
# Install script for dotfiles
# TODO: install packages based on system
# For now just link proper folders in .config folder

rm -rf $HOME/.config/awesome/
rm -rf $HOME/.config/kitty/
rm -rf $HOME/.config/nvim/
rm -rf $HOME/.config/picom/
rm -rf $HOME/.config/rofi/
rm -rf $HOME/.config/wallpapers/

ln -s ./awesome/ $HOME/.config/
ln -s ./kitty/ $HOME/.config/
ln -s ./nvim/ $HOME/.config/
ln -s ./picom/ $HOME/.config/
ln -s ./rofi/ $HOME/.config/
ln -s ./wallpapers/ $HOME/.config/
