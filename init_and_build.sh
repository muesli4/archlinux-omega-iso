#!/bin/bash

build_iso() {
    ISO_LABEL="ARCH_OMEGA_$(date '+%Y%m')"

    cp -r /usr/share/archiso/configs/releng iso-build
    cp -r airootfs iso-build/
    cp packages.x86_64 iso-build/
    cd iso-build
    mkdir work out
    sudo ./build.sh -v \
        -N archlinux_omega \
        -L ARCH_OMEGA_201901 \
        -P 'muesli4 (at) gmail (dot) com' \
        -A 'Arch Linux Omega Live CD'
}

pacman -Qi archiso > /dev/null

if [ $? == 1 ]; then
    echo "archiso is missing, please run 'sudo pacman -S archiso' and try again."
else
    build_iso
fi
