#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    if [ ! $(dscl . -read /Users/$USER UserShell | awk '{print $2}') == $(which zsh) ]; then
		if ! cat /etc/shells | grep --quiet $(which zsh); then
			echo $(which zsh) | sudo tee -a /etc/shells
		fi
		echo "Setting login shell to zsh" && chsh -s $(which zsh)
	fi     
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	if [ -n "$($SHELL -c 'echo $ZSH_VERSION')" ]; then
		echo ''
	elif [ -n "$($SHELL -c 'echo $BASH_VERSION')" ]; then
		echo 'Detected Bash switch to zsh'
		echo 'please run sudo chsh -s $(which zsh) $USER'
	else
	  	echo 'No Zsh or Bash detected - switch to zsh'
		echo 'please run sudo chsh -s $(which zsh) $USER'
	fi
fi

[[ -d ${ZDOTDIR:-~}/.zprezto ]] ||

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	cd $ZPREZTODIR
	git pull
	git submodule sync --recursive
	git submodule update --init --recursive
fi

# case "$OSTYPE" in
#   darwin*)  echo "Bootstrapping OSX" ;; 
#   linux*)   linux_prep ;;
#   bsd*)     echo "BSD" ;;
#   msys*)    echo "WINDOWS" ;;
#   cygwin*)  echo "ALSO WINDOWS" ;;
#   *)        echo "unknown: $OSTYPE" ;;
# esac
