#! /bin/bash

dir=`dirname $0`

# command line tools
xcode-select --install

# rbenv
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# zsh
brew install zsh
curl -L http://install.ohmyz.sh | sh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh

HOMEBREW_CASK_OPTS="--appdir=/Applications" brew bundle

# copy font
cp -f /usr/local/Cellar/ricty/3.2.4/share/fonts/*.ttf ~/Library/Fonts/ 
fc-cache -vf

#setting files
cp "${dir}/.*" ~/
cp "${dir}/*" ~/

# reload .zshrc
source ~/.zshrc

# http://inforati.jp/apple/mac-tips-techniques/system-hints/how-to-show-hidden-file-or-folder-of-macos.html
defaults write com.apple.finder AppleShowAllFiles -boolean true

# http://blancbooth.com/archives/62
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
find ~/* -name ".DS_Store" -print -exec rm {} ";"

killall Finder

# make dir
mkdir ~/bin
mkdir ~/data
mkdir ~/development
mkdir ~/development/my
mkdir ~/development/works
mkdir ~/development/projects

# peco
go get github.com/lestrrat/peco/cmd/peco/

# nvm
nvm install v0.10.26
nvm use v0.10.26
nvm alias default 0.10.26

# ghq
go get github.com/motemen/ghq

# tmux-powerline
git clone https://github.com/erikw/tmux-powerline.git ~/

