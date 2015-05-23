#!/bin/sh
#----------------------------------------------------------
# Change colours of output text:
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
# e.g. echo "${red}red text ${green}green text${reset}"
# Source: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
#----------------------------------------------------------
abort()
{
    tput setaf 1
    echo >&2 '
***************
*** ABORTED ***
***************
'
    echo "An error occurred. Exiting..." >&2
    exit 1
}
 
trap 'abort' 0
 
set -e
# Add your script below...
#==========================================================
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 


# Install Webmin - Note that webmin passwd configured in WebminSetup.exp
echo "\n${green}Webmin setup...${reset}"
WEBMIN_URL="http://www.webmin.com/download/webmin-current.tar.gz"
apt-get -y install expect libnet-ssleay-perl libcrypt-ssleay-perl
rm -rf ~/webmin_temp/installation_files
mkdir ~/webmin_temp/installation_files
cd ~/webmin_temp/installation_files
wget --no-check-certificate -O "webmin.tar.gz" "$WEBMIN_URL" 
tar xzf webmin.tar.gz
rm -f webmin.tar.gz
cd webmin-*/
cp ~/webmin_temp/WebminSetup.exp .
/usr/bin/expect ./WebminSetup.exp


#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
#----------------------------------------------------------
trap : 0
 
tput setaf 2 
echo >&2 '
**************
**** DONE **** 
**************
'
#----------------------------------------------------------
