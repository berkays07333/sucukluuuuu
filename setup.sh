#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    distro=$(awk -F= '$1 == "ID" {print $2}' /etc/os-release)
    if [[ "$distro" == "arch" ]]; then
       echo "-> Arch Linux Detected"
       sudo pacman -S --needed unace unrar zip unzip p7zip sharutils uudeview arj cabextract file-roller dtc xz python-pip brotli lz4 gawk libmpack aria2
       #aur=rar
    else
       echo "-> Starting the installation of packages"
       sudo apt install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev python-pip brotli liblz4-tool gawk aria2
    fi
    pip install backports.lzma protobuf pycrypto
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "-> Darwin Detected". 
    echo "  - Starting the installation of packages"
    brew install protobuf xz brotli lz4 aria2
    pip install backports.lzma protobuf pycrypto
fi

git clone --depth 1 https://github.com/erfanoabdi/vendor_vndk.git prebuilt/vendor_vndk
git clone --depth 1 https://github.com/gmrt/update_payload_extractor.git tools/update_payload_extractor
git clone --depth 1 https://github.com/erfanoabdi/ROM_resigner.git tools/ROM_resigner
git clone --depth 1 https://github.com/bkerler/oppo_ozip_decrypt.git tools/oppo_ozip_decrypt 

sudo chmod -R +x *
sudo chmod -R 0777 *
