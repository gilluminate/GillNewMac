#!/bin/sh
echo "**************************"
echo "Requires XCode Dev Tools"
echo "**************************"
echo ""
read -p "Have you already installed XCode Devloper Tools? (y/n) "

if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
	then
  		read -p "Install Oh My Zsh? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "installing oh-my-zsh"
				sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		fi
  		read -p "reverence cloud User Settings? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "creating gitconfig softlink"
				ln -s ~/Documents/Settings/User/.gitconfig ~/.gitconfig
				echo "creating gitingore softlink"
				ln -s ~/Documents/Settings/User/.gitignore ~/.gitignore
				echo "set zsh home"
				echo "export ZDOTDIR=~/Documents/Settings/User/" >> ~/.zshenv
		fi
  		read -p "Install Node Version Manager? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "installing nvm"
				curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
		fi
  		read -p "Install Node LTS? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "installing node"
				nvm install --lts | bash
				echo "installing latest npm"
    				npm i -g npm
		fi
		read -p "Install Homebrew? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "installing homebrew"
				/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
				brew doctor
				brew update
		fi
		read -p "Install Homebrew packages in brewList? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				brew tap homebrew/cask
				brew tap thoughtbot/formulae
				echo "installing brew packages"
				brews=(`cat brewList`)
				for package in "${brews[@]}"
					do
						brew install $package
				done
		fi
		read -p "Install Homebrew Casks in brewCaskList? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "installing cask apps"
				casks=(`cat brewCaskList`)
				for app in "${casks[@]}"
					do
						brew install --cask $app
				done
				echo "checking linked apps"
		fi
		read -p "Install NPM packages in npmList? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "installing npm packages"
				npms=(`cat npmList`)
				for package in "${npms[@]}"
					do
						npm install -g $package
				done
		fi
		read -p "Unhide ~/Library/? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "unhiding library"
				chflags nohidden ~/Library/
		fi
		read -p "Generate SSH Key? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				ssh-keygen
		fi
		read -p "Open App store? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "opening app store"
				open -a App\ Store
		fi
fi
