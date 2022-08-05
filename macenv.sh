#!/bin/bash -e

Color_Off='\033[0m'       # Text Reset

BGreen='\033[1;32m'       # Green
BBlue='\033[1;34m'        # Blue

loginfo(){
  echo -e "${BBlue}$1${Color_Off}"
}

logsuccess(){
  echo -e "${BGreen}$1${Color_Off}"
}

loginfo "Change shell to bash"
chsh -s /bin/bash


loginfo "Install homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


packages="vim git nvm wget curl docker zsh"
for package in $packages; do
  loginfo "Install $package..."
  brew install $package
done

loginfo "Set git global config"
echo "Please enter your git username"
read name
git config --global user.name "$name"

echo "Please enter your git email"
read email
git config --global user.email "$email"

logsuccess "global user.name is `git config --global user.name`"
logsuccess "global user.email is `git config --global user.email`"

# loginfo "install VS Code"
# brew install --cask visual-studio-code


logsuccess "initial instllation is complete.  Things that haven't been automated"
echo "that you may need to install include:"
echo """
    - Docker Desktop
    - Chrome Desktop
  """

