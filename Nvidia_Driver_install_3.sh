echo "install cuda10.1"

sub_dist=$(cat /etc/redhat-release)
arch=$(uname -m)

if [ ${sub_dist:0:6}${sub_dist:21:1} = CentOS7 ];then
	dist="rhel7"
	echo "Version : ${sub_dist:0:22}"
elif [ ${sub_dist:0:6}${sub_dist:21:1} = CentOS8 ];then
	dist="rhel8"
	echo "Version : ${sub_dist:0:22}"
else
	echo "we support CentOS 7,8"
fi

wget https://developer.download.nvidia.com/compute/cuda/repos/$dist/$arch/cuda-repo-$dist-10.1.105-1.$arch.rpm
sudo rpm -import https://developer.download.nvidia.com/compute/cuda/repos/$dist/$arch/7fa2af80.pub
sudo rpm -i cuda-repo-$dist-10.1.105-1.$arch.rpm
sudo yum clean all
wget http://developer.download.nvidia.com/compute/machine-learning/repos/$dist/$arch/nvidia-machine-learning-repo-$dist-1.0.0-1.$arch.rpm
sudo yum install -y ./nvidia-machine-learning-repo-$dist-1.0.0-1.$arch.rpm

sudo rm cuda-repo-$dist-10.1.105-1.$arch.rpm
sudo rm nvidia-machine-learning-repo-$dist-1.0.0-1.$arch.rpm

read -p "System reboot is required. Would you like to restart now? [y/n] " yn
case $yn in
	[Yy]* ) echo "System restarting"
		sudo reboot;;
	[Nn]* ) exit;;
esac
