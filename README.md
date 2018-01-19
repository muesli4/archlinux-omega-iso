## What is it?

A linux live iso based on Archlinux that includes everything I will eventually need from a live system.

### Features

* MATE desktop environment with my custom settings
* A web browser (chromium)
* GParted
* testdisk
* gvim with my custom settings
* zeroconf pulseaudio streaming
* pidgin, hexchat, mpv and mpc

## Instructions

Use [archiso](https://wiki.archlinux.org/index.php/archiso) to setup the directory and then just copy the files from this repository over it. You may want to change your timezone and the keyboard if you're not from Germany:

* `airootfs/etc/vconsole.conf`
* `airootfs/root/customize_airootfs.sh`
* `airootfs/etc/X11/xorg.conf.d/00-keyboard.conf`

Run `mkdir out work ; sudo ./build -v` to build the iso.

