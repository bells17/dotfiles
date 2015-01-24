#! /bin/bash

dir=`dirname $0`
cd $dir

# command line tools
xcode-select --install

# homebrew
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
cp "${dir}/home/.*" ~/
cp "${dir}/home/*" ~/

# reload .zshrc
source ~/.zshrc

# http://inforati.jp/apple/mac-tips-techniques/system-hints/how-to-show-hidden-file-or-folder-of-macos.html
defaults write com.apple.finder AppleShowAllFiles -boolean true

# http://blancbooth.com/archives/62
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
find ~/* -name ".DS_Store" -print -exec rm {} ";"

killall Finder

# http://www.lifehacker.jp/2012/01/120112copytextfromquicklook.html
defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder

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

# git
git config --global push.default matching
git config --global alias.ci commit
git config --global alias.pl pull
git config --global alias.co checkout
git config --global alias.br branch
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global alias.gr "log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'"

# rbenv
rbenv install 2.1.5
rbenv rehash
rbenv global 2.1.5
rbenv exec gem install bundler
rbenv rehash

# install gem tools
bundle install

