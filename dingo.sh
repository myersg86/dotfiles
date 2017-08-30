#!/bin/bash
set -exbE
USERNAME="$1"

if [ -z "$1"]; then
	echo "No username supplied"
fi &&
echo "preparing dotfiles for $1" &&

cd "/home/$USERNAME/" &&
/bin/rm -rvf "/home/$USERNAME/dotfiles_old" &&
sudo -u "$USERNAME" mkdir "/home/$USERNAME/dotfiles_old" &&
mv -vf "/home/$USERNAME/.vim/" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/.vimrc" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/.vim_runtime/" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/.bashrc" "/home/$USERNAME/dotfiles_old/" &&
mv -vf "/home/$USERNAME/.tmux.conf" "/home/$USERNAME/dotfiles_old/" &&
# mv git-prompt.sh "/home/$USERNAME/dotfiles_old/" &&
# mv git-completion.bash "/home/$USERNAME/dotfiles_old/" &&
/bin/rm -rvf "/home/$USERNAME/.vim";
sudo -u "$USERNAME" mkdir -v "/home/$USERNAME/.vim" &&
sudo -u "$USERNAME" git clone -v https://github.com/flazz/vim-colorschemes.git "/home/$USERNAME/.vim" &&
sudo -u "$USERNAME" git clone -v git://github.com/amix/vimrc.git "/home/$USERNAME/.vim_runtime" &&
sudo -u "$USERNAME" bash "/home/$USERNAME/.vim_runtime/install_basic_vimrc.sh" &&
sudo -u "$USERNAME" mv -vf "/home/$USERNAME/.vimrc" "/home/$USERNAME/dotfiles_old/"
# wget sudo -u "$USERNAME" https://raw.githubusercontent.com/myersg86/dotfiles/master/git-completion.bash &&
# wget sudo -u "$USERNAME"  https://raw.githubusercontent.com/myersg86/dotfiles/master/git-prompt.sh &&
sudo -u "$USERNAME" wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.bashrc &&
sudo -u "$USERNAME" wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.vimrc &&
sudo -u "$USERNAME" wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.tmux.conf
