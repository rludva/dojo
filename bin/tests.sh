#! /bin/bash -e

# Basic color values..
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`


MY_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export GOPATH="$MY_PATH/.."

export FILE_PACKAGE_NAME="$MY_PATH/../package_name"
if [ ! -e "$FILE_PACKAGE_NAME" ]; then
  echo "Error: package_name file does not exists.."
  exit 1
fi

export PACKAGE=`cat $FILE_PACKAGE_NAME`

YEAR=`date +"%Y"`
DATE=`date '+%Y-%m-%d'`
FOLDER="$MY_PATH/../$YEAR/$DATE"
FOLDER="$FOLDER/$PACKAGE"

#
if [ ! -e "$FOLDER" ]; then 
  mkdir -p "$FOLDER"
fi


#
cd $FOLDER && go fmt && go test -v | sed /PASS/s//$(printf "${green}PASS${reset}")/ | sed /FAIL/s//$(printf "${red}FAIL${reset}")/
