#!/bin/bash
set -e

VIMRC=~/.vimrc
AUTOLOAD=~/.vim/autoload
VIMEXE=vim

if (which nvim > /dev/null); then
  VIMRC=~/.config/nvim/init.vim
  AUTOLOAD=~/.config/nvim/autoload
  VIMEXE=nvim
fi

cat <<WhatWillHappen

  I detected that you're using $VIMEXE.

  I'm going to...
    - clone dotfiles into '~/.dotfiles'
    - install vim-plug
    - move your existing vimrc
         from: '$VIMRC'
	 to:   '$VIMRC.bak'
    - symlink
         from: '$VIMRC'
	 to:   '~/.dotfiles/vimrc'
    - install all plugins listed in
         '~/.dotfiles/vim/vimrc.plugs'

  If you're not comfortable with these plans,
  you can abort now by pressing <C-c>.

WhatWillHappen

read THROW_AWAY

echo -n "Installing vim-plug... "
curl -sfLo $AUTOLOAD/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "done."

echo -n "Installing dotfiles... "
git clone --quiet https://github.com/ubaydinoyatov/dotfiles.git ~/.dotfiles
echo "done."

if [[ -f $VIMRC ]]; then
  echo -n "Backing up existing vimrc... "
  mv $VIMRC $VIMRC.bak
  echo "done."
fi

echo -n "Linking vimrc... "
ln -s ~/.dotfiles/vimrc $VIMRC
echo "done."

echo -n "Installing plugins... "
command $VIMEXE +PlugInstall +qall
echo "done."
