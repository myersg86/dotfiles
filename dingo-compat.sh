#!/bin/bash
set -exbE
USERNAME="$1"
# Check that username is provided
if [ -z "$1"]; then
	echo "No username supplied"
	exit
fi &&
# Must be run with SUDO priveleges
if [ "$EUID" -ne 0 ]
  then echo "Please execute script with SUDO"
  exit
fi &&
echo "preparing dotfiles for $1" &&
cd "/home/$USERNAME/" &&
/bin/rm -rvf "/home/$USERNAME/dotfiles_old" &&
sudo -u "$USERNAME" mkdir "/home/$USERNAME/dotfiles_old" &&
mv -vf "/home/$USERNAME/.vim/" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/.vimrc" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/.vim_runtime/" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/.bashrc" "/home/$USERNAME/dotfiles_old/" &&
# mv -vf "/home/$USERNAME/.tmux.conf" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/git-prompt.sh" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/git-completion.bash" "/home/$USERNAME/dotfiles_old/" &&
/bin/rm -rvf "/home/$USERNAME/.vim" &&
sudo -u "$USERNAME" mkdir -v "/home/$USERNAME/.vim" &&
sudo -u "$USERNAME" git clone -v https://github.com/flazz/vim-colorschemes.git "/home/$USERNAME/.vim" &&
sudo -u "$USERNAME" git clone -v git://github.com/amix/vimrc.git "/home/$USERNAME/.vim_runtime" &&
sudo -u "$USERNAME" bash "/home/$USERNAME/.vim_runtime/install_basic_vimrc.sh" &&
sudo -u "$USERNAME" mv -vf "/home/$USERNAME/.vimrc" "/home/$USERNAME/dotfiles_old/" &&
sudo -u "$USERNAME" wget https://raw.githubusercontent.com/myersg86/dotfiles/master/git-completion.bash &&
sudo -u "$USERNAME" wget  https://raw.githubusercontent.com/myersg86/dotfiles/master/git-prompt.sh &&
sudo -u "$USERNAME" wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.bash-compat-rc &&
sudo -u "$USERNAME" mv -vf "/home/$USERNAME/".bash-compat-rc" "/home/$USERNAME/.bashrc" &&
sudo -u "$USERNAME" wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.vi-compatible-rc &&
sudo -u "$USERNAME" mv -vf "/home/$USERNAME/".vi-compatible-rc" "/home/$USERNAME/.vimrc"
