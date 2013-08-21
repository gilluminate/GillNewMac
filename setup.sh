#!/bin/sh
brews=(`cat brewList`)
casks=(`cat brewCaskList`)
npms=(`cat npmList`)
echo "installing homebrew"
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew tap phinze/homebrew-cask
echo "installing brew packages"
for package in "${brews[@]}"
	do
		brew install $package
done
echo "installing cask apps"
for app in "${casks[@]}"
	do
		brew cask install $app
done
echo "installing npm packages"
for package in "${npms[@]}"
	do
		npm install -g $package
done
echo "opening app store for convenience"
open -a App\ Store
