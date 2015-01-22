#!/bin/sh

#http://inforati.jp/apple/mac-tips-techniques/system-hints/how-to-show-hidden-file-or-folder-of-macos.html
defaults write com.apple.finder AppleShowAllFiles -boolean true

#http://blancbooth.com/archives/62
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
find ~/* -name ".DS_Store" -print -exec rm {} ";"

killall Finder


#brew bundle

# peco
go get github.com/lestrrat/peco/cmd/peco/

