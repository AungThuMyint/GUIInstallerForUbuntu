echo
echo -e "\e[1;36m[*] ============================ [*]\e[0m"
echo -e "\e[1;36m[+]   GUI Installer For Ubuntu   [+]\e[0m"
echo -e "\e[1;36m[*] ============================ [*]\e[0m"
echo
read -p "Type Username : " username
read -p "Type Password : " pass
echo
sudo apt-get update -y
sudo apt-get install lxde -y
sudo apt-get install xrdp -y
service xrdp start
sudo apt install xrdp xfce4 xfce4-goodies tightvncserver
sudo service xrdp restart
echo xfce4-session> /home/$username/.xsession
sudo cp /home/$username/.xsession /etc/skel
sudo sed -i '0,/-1/s//ask-1/' /etc/xrdp/xrdp.ini
sudo service xrdp restart
echo -e "$pass\n$pass" | passwd $username
ip=$(hostname --all-ip-addresses | awk '{print $1}'  )
clear
echo
echo -e "\e[1;31m[*] ============================ [*]\e[0m"
echo -e "\e[1;31m[+]   GUI Installer For Ubuntu   [+]\e[0m"
echo -e "\e[1;31m[*] ============================ [*]\e[0m"
echo
echo -e "\e[1;32m[*] Username\e[0m ~\e[1;36m" $username "\e[0m"
echo -e "\e[1;32m[*] Password\e[0m ~\e[1;36m" $pass "\e[0m"
echo -e "\e[1;32m[*] IP Address\e[0m ~\e[1;36m" $ip "\e[0m"
echo
read -p "Press [ENTER] to continue and reboot system ... "
reboot