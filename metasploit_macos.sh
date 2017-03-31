#!/bin/bash
clear
read -p "Do you wish to download Metasploit.pkg installer for macOS? (y/n) 
" yn
    case $yn in
        [Yy]* ) open -g http://osx.metasploit.com/metasploitframework-latest.pkg ;;
        [Nn]* ) exit 2 ;;
        * ) echo "Please answer yes or no.
        ";;
    esac

echo ""

echo "Adding msfdb alias"
echo ""
perl -pi -e 'if(/msfdb/){undef $_}' ~/.profile

echo 'msfdb_init () {
cd /opt/metasploit-framework/bin #msfdb dir
./msfdb init' >> ~/.profile
echo '} #msfdb alias
#####################################' >> ~/.profile 

echo "Adding msfconsole alias"
echo ""
perl -pi -e 'if(/msfconsole/){undef $_}' ~/.profile

echo 'msfconsole () {
cd /opt/metasploit-framework/bin #msfconsole dir
./msfconsole' >> ~/.profile
echo '} #msfconsole alias
#####################################' >> ~/.profile

echo "Now restart Terminal.app please, and start the graphical installation of Metasploit, to start executing the msfconsole command or better to run the included application."
echo ""