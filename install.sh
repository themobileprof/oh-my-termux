#!/data/data/com.termux/files/usr/bin/bash

pkg install -y git zsh curl zip gh openssh
clear

if [ -d "$HOME/.termux" ]; then
 mv $HOME/.termux $HOME/.termux.bak
fi

curl -fsLo $HOME/.termux/colors.properties --create-dirs https://cdn.jsdelivr.net/gh/4679/oh-my-termux@master/.termux/colors.properties
curl -fsLo $HOME/.termux/font.ttf --create-dirs https://cdn.jsdelivr.net/gh/4679/oh-my-termux@master/.termux/font.ttf

git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh --depth 1
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' $HOME/.zshrc
chsh -s zsh

termux-setup-storage

echo "Done! Please restart Termux."

exit
