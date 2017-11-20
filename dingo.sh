#!/bin/bash
set -exbE
USERNAME="$1"
# Check that username is provided
if [ -z "$1" ]; then
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
mv -vf "/home/$USERNAME/.vim" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/.vimrc" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/.vim_runtime" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/.bashrc" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/.tmux.conf" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/git-prompt.sh" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/git-completion.bash" "/home/$USERNAME/dotfiles_old/" &&
/bin/rm -rvf "/home/$USERNAME/.vim";
mkdir -v "/home/$USERNAME/.vim" &&
git clone -v https://github.com/flazz/vim-colorschemes.git "/home/$USERNAME/.vim" &&
git clone -v git://github.com/amix/vimrc.git "/home/$USERNAME/.vim_runtime" &&
bash "/home/$USERNAME/.vim_runtime/install_basic_vimrc.sh" &&
mv -vf "/home/$USERNAME/.vimrc" "/home/$USERNAME/dotfiles_old/"
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/git-completion.bash &&
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/git-prompt.sh &&
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.bashrc &&
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.vimrc &&
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.tmux.conf
