sub_dist=$(cat /etc/redhat-release)
arch=$(uname -m)

if [ ${sub_dist:0:6}${sub_dist:21:1} = CentOS7 ];then
	dist="rhel7"
	echo "Version : ${sub_dist:0:22}"
else
	echo "check your OS"
fi

sudo sed 's/quiet"/quiet rd.driver.blacklist=nouveau nouveau.modeset=0"/' /etc/default/grub
echo "blacklist nouveau">/etc/modprobe.d/blacklist-nouveau.conf
echo "options nouveau modeset=0">>/etc/modprobe.d/blacklist-nouveau.conf
sudo dracut --force
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg

sudo yum install kernel-devel kernel-headers gcc make -y
sudo yum update kernel kernel-devel -y

read -p "System reboot is required. Would you like to restart now? [y/n] " yn
case $yn in
	[Yy]* ) echo "System restarting"
		sudo reboot;;
	[Nn]* ) exit;;
esac
