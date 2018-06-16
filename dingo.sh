#!/bin/bash
set -ebE

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
bash ".vim_runtime/install_basic_vimrc.sh" &&
rm -v .vimrc
wget -v https://raw.githubusercontent.com/myersg86/dotfiles/master/git-completion.bash &&
wget -v https://raw.githubusercontent.com/myersg86/dotfiles/master/git-prompt.sh &&
wget -v https://raw.githubusercontent.com/myersg86/dotfiles/master/.bashrc &&
wget -v https://raw.githubusercontent.com/myersg86/dotfiles/master/.vimrc &&
wget -v https://raw.githubusercontent.com/myersg86/dotfiles/master/.tmux.conf &&
# install hh - https://github.com/dvorka/hstr/blob/master/INSTALLATION.md
echo "You're all set, enjoy!"
