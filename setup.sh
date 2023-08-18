#!/bin/sh
echo "**************************"
echo "Requires XCode Dev Tools"
echo "**************************"
echo ""
read -p "Have you already installed XCode Devloper Tools? (y/n) "

if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
	then
  		read -p "Install Node Version Manager? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "installing nvm"
				ruby -e "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash)"
		fi
  		read -p "Install Node LTS? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "installing node"
				nvm install --lts
				echo "installing latest npm"
    				npm i -g npm
		fi
		read -p "Install Homebrew? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "installing homebrew"
				ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
