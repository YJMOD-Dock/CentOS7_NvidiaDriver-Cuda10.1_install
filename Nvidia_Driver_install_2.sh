sudo lshw -class display
echo "find your Nvidia driver"

read -p "Enter your nvidia-driver-(number) {ex: 440}: " input

read -p "Do you want to install nvidia-driver-$input [y/n] " yn
case $yn in
	[Yy]* )	echo "install Nvidia-drvier";;
	[Nn]* ) exit;;
esac

case $input in
	440) wget http://us.download.nvidia.com/XFree86/Linux-x86_64/440.64/NVIDIA-Linux-x86_64-440.64.run
		sudo bash NVIDIA-Linux-x86_64-440.64.run
		sudo rm NVIDIA-Linux-x86_64-440.64.run;;
	435) wget http://us.download.nvidia.com/XFree86/Linux-x86_64/435.21/NVIDIA-Linux-x86_64-435.21.run
		sudo bash NVIDIA-Linux-x86_64-435.21.run
		sudo rm NVIDIA-Linux-x86_64-435.21.run;;
	390) wget http://us.download.nvidia.com/XFree86/Linux-x86_64/390.132/NVIDIA-Linux-x86_64-390.132.run
		sudo bash NVIDIA-Linux-x86_64-390.132.run
		sudo rm NVIDIA-Linux-x86_64-390.132.run;;
	340) wget http://us.download.nvidia.com/XFree86/Linux-x86_64/340.108/NVIDIA-Linux-x86_64-340.108.run
		sudo bash NVIDIA-Linux-x86_64-340.108.run
		sudo rm NVIDIA-Linux-x86_64-340.108.run;;
	???) echo "check your GPU driver"
		exit;;
esac

read -p "System reboot is required. Would you like to restart now? [y/n] " yn
case $yn in
	[Yy]* ) echo "System restarting"
		sudo reboot;;
	[Nn]* ) exit;;
esac
