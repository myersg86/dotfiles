https://github.com/amix/vimrc

https://github.com/arcticicestudio/nord-dircolors

https://github.com/flazz/vim-colorschemes

https://github.com/mrzool/bash-sensible

```
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/dingo.sh
sudo bash ./dingo.sh
```
```
#!/bin/bash
set -exbE
cd ~/ &&
/bin/rm -rvf ~/dotfiles_old;
mkdir ~/dotfiles_old &&
mv -vf ~/.vim/ ~/dotfiles_old/ &&
mv -vf ~/.vimrc ~/dotfiles_old/ &&
mv -vf ~/.vim_runtime/ ~/dotfiles_old/ &&
mv -vf ~/.bashrc ~/dotfiles_old/ &&
mv -vf ~/.tmux.conf ~/dotfiles_old/ &&
# mv git-prompt.sh dotfiles_old/. &&
# mv git-completion.bash dotfiles_old/. &&
/bin/rm -rvf ~/.vim;
mkdir -v ~/.vim &&
git clone -v https://github.com/flazz/vim-colorschemes.git ~/.vim &&
git clone -v git://github.com/amix/vimrc.git ~/.vim_runtime &&
bash ~/.vim_runtime/install_basic_vimrc.sh &&
mv -vf ~/.vimrc ~/dotfiles_old/
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.bashrc &&
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.vimrc &&
wget https://raw.githubusercontent.com/myersg86/dotfiles/master/.tmux.conf
# wget https://raw.githubusercontent.com/myersg86/dotfiles/master/git-completion.bash &&
# wget https://raw.githubusercontent.com/myersg86/dotfiles/master/git-prompt.sh
```
