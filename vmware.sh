#! /bin/bash
#This script is used to patch VMware Workstation on Kali/Ubuntu Linux.  Perform the following steps before running:
#Update system
#Install Latest version of VMware Workstation
#Set correct version for the 'VMWARE_VERSION' variable

#Credit to Charly and Michal Kubecek
#https://askubuntu.com/questions/1041912/installing-vmware-on-18-04-failed-to-build-vmmon

VMWARE_VERSION=workstation-15.1.0
TMP_FOLDER=/tmp/patch-vmware
rm -fdr $TMP_FOLDER
mkdir -p $TMP_FOLDER
cd $TMP_FOLDER
git config --global http.proxy http://127.0.0.1:8118
git clone https://github.com/mkubecek/vmware-host-modules.git
cd $TMP_FOLDER/vmware-host-modules
git checkout $VMWARE_VERSION
git fetch
make
sudo make install
sudo rm /usr/lib/vmware/lib/libz.so.1/libz.so.1
sudo ln -s /lib/x86_64-linux-gnu/libz.so.1 /usr/lib/vmware/lib/libz.so.1/libz.so.1
sudo /etc/init.d/vmware restart