#!/bin/bash
git clone git://github.com/robbyrussell/oh-my-zsh.git /home/nikmash/.oh-my-zsh
cd /home/nikmash/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

shopt -s dotglob
for file in /home/nikmash/dev/environment/shell/dotfiles/*; do
	name=${file##*/}
	echo $name
	ln -s $file /home/nikmash/$name
done

mkdir /home/nikmash/.unison/
ln -s /home/nikmash/dev/environment/shell/custom/unison/default.prf /home/nikmash/.unison/default.prf

