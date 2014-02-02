#!/bin/sh
echo "**************************"
echo "Requires XCode Dev Tools"
echo "**************************"
echo ""
read -p "Have you already installed XCode Devloper Tools? (y/n) "

if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
	then
		read -p "Install Homebrew? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "installing homebrew"
				ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
				brew doctor
				brew update
		fi
		read -p "Install Homebrew packages in brewList? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				brew tap phinze/homebrew-cask
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
						brew cask install $app
				done
				echo "linking apps"
				brew cask linkapps
				brew cask alfred link
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
                read -p "Install 'Legit' git aliases? "
                if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
                        then
                                echo "installing Legit"
				legit install
                fi
		read -p "Unhide ~/Library/? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "unhiding library"
				chflags nohidden ~/Library/
		fi
		read -p "Open App store? "
		if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
			then
				echo "opening app store"
				open -a App\ Store
		fi
fi
