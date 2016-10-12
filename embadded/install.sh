#!/bin/bash
# Am I root?
urlBase='http://fuyuanli.github.io/embadded'
userName=`whoami`
echo "歡迎使用 嵌入式系統 環境建置程式 by fuyuanli"
cd "/home/$userName"
echo "目前目錄為 `pwd`"
echo "請輸入密碼繼續"
sudo mv "/etc/apt/sources.list" "/etc/apt/sources.list.bak"
sudo wget "$urlBase/sources.list" -O "/etc/apt/sources.list"
sudo apt-get update
sudo apt-get install vim patch libncurses5-dev uboot-mkimage -y
sudo rm -rf "/home/$userName/microtime"

cd /
echo "目前目錄為 `pwd`"
sudo wget "$urlBase/arm-linux-toolchain-bin.4.0.2.tar.gz"
sudo tar -zxvf "arm-linux-toolchain-bin.4.0.2.tar.gz"
echo 'PATH="/opt/microtime/pro/devkit/arm/pxa270/gcc-4.0.2-glibc-2.3.3/arm-unknown-linux-gnu/bin:$PATH"' >> "/home/$userName/.bashrc"
echo "Path 設定完畢"

cd "/home/$userName"
echo "目前目錄為 `pwd`"
wget "$urlBase/mt-linux-2.6.15.3.tar.gz"
sudo tar -zxvf "mt-linux-2.6.15.3.tar.gz"


cd "/home/$userName/microtime/pro/devkit/lsp/create-pxa270"
echo "目前目錄為 `pwd`"
sudo wget "$urlBase/linux-2.6.15.3-creator-pxa270.patch"
sudo patch -p0 < "linux-2.6.15.3-creator-pxa270.patch"

cd "/home/$userName/microtime"
echo "目前目錄為 `pwd`"
sudo "./pxa270.sh"

cd "/home/$userName"
echo "目前目錄為 `pwd`"
wget "$urlBase/rootfs.tar.gz"
sudo tar -zxvf "rootfs.tar.gz"
sudo chown $userName:$userName microtime/ -R
echo  "執行完畢，自動啟動新的命令列視窗"
echo  "＝＝＝＝＝請關閉此視窗＝＝＝＝＝"
gnome-terminal
exit
