https://github.com/amix/vimrc
https://github.com/arcticicestudio/nord-dircolors
https://github.com/flazz/vim-colorschemes
https://github.com/mrzool/bash-sensible

```
#!/bin/bash
set -ex
cd ~/ &&
mkdir dotfiles_old &&
mv .vim/ dotfiles_old/. &&
mv .vimrc dotfiles_old/. &&
mv .vim_runtime/ dotfiles_old/. &&
mv .bashrc dotfiles_old/. &&
mv git-prompt.sh dotfiles_old/. &&
mv git-completion.bash dotfiles_old/. &&
mkdir ~/.vim &&
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim &&
git clone git://github.com/amix/vimrc.git ~/.vim_runtime &&
bash ~/.vim_runtime/install_basic_vimrc.sh &&
mv .vimrc dotfiles_old/.vimrc_basic &&
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.bashrc &&
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.vimrc &&
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/git-completion.bash &&
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/git-prompt.sh &&
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.tmux.conf
```
