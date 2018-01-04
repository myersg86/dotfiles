#!/bin/bash
set -ebE

# OPTIONALLY REQUIRE RUN AS SUDO
# Must be run with SUDO priveleges
# if [ "$EUID" -ne 0 ]
#  then echo "Please execute script with SUDO priveleges"
#  exit
# fi &&

# CURRENT USER IS DEFAULT. TO CHANGE THIS, UNCOMMENT LINES 12 and 13 AND REMOVE LINE 15
# echo "What user would you like to install these config settings for?"
# read -p "username: " USERNAME

USERNAME="$USER"

echo "OK '$USERNAME', lets do this! Are you ready?"
echo "preparing dotfiles for '$USERNAME' ..." &&

cd "/home/$USERNAME/" &&
/bin/rm -rvf .vim .vimrc .vim_runtime .bashrc .tmux.conf
mkdir -v "/home/$USERNAME/.vim" &&
git clone -v https://github.com/flazz/vim-colorschemes.git "/home/$USERNAME/.vim" &&
git clone -v --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime "/home/$USERNAME/.vim_runtime" &&
bash "/home/$USERNAME/.vim_runtime/install_basic_vimrc.sh" &&
rm -v .vimrc
wget -v https://raw.githubusercontent.com/myersg86/dotfiles/master/git-completion.bash &&
wget -v https://raw.githubusercontent.com/myersg86/dotfiles/master/git-prompt.sh &&
wget -v https://raw.githubusercontent.com/myersg86/dotfiles/master/.bashrc &&
wget -v https://raw.githubusercontent.com/myersg86/dotfiles/master/.vimrc &&
wget -v https://raw.githubusercontent.com/myersg86/dotfiles/master/.tmux.conf &&
echo "You're all set, enjoy!"
