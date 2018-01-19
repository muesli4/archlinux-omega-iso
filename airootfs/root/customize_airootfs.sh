#!/bin/bash

set -e -u

# locale
sed -i 's/#\(de_DE\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

# timezone
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

cp -aT /etc/skel/ /root/
chmod 700 /root

# setup live cd user
LIVE_HOME_DIR=/home/liveuser/
! id liveuser && useradd -d "$LIVE_HOME_DIR" -p '' -g users -G "disk,wheel,uucp,network,video,audio,storage" liveuser
chown liveuser:users "$LIVE_HOME_DIR"
chmod -R 700 "$LIVE_HOME_DIR"

# enable sudo
if [ -z "$(grep liveuser /etc/sudoers)" ]; then
    echo -e "liveuser ALL=(ALL) ALL\n" >> /etc/sudoers
fi

# ship mate settings
# TODO find a better way than defaults
function replace_gsettings_default()
{
    FILE="/usr/share/glib-2.0/schemas/$1"
    OBJECT_PATH="$2"
    KEY="$3"
    VAL="$4"

    xmlstarlet ed -u "/schemalist/schema[@id=\"$OBJECT_PATH\"]/key[@name=\"$KEY\"]/default" -v "$VAL" "$FILE" > "$FILE.tmp"
    mv "$FILE.tmp" "$FILE"
}

replace_gsettings_default org.mate.background.gschema.xml org.mate.background picture-filename "'/usr/share/backgrounds/mate/nature/Aqua.jpg'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.general theme "'Blue-Submarine'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.general titlebar-font "'DejaVu Sans Bold 10.5'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.general wrap-style "'toroidal'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.general side-by-side-tiling 'false'
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.general compositing-manager 'false'
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.general center-new-windows 'false'
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.general num-workspaces 6
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.global-keybindings switch-to-workspace-1 "'<Alt>1'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.global-keybindings switch-to-workspace-2 "'<Alt>2'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.global-keybindings switch-to-workspace-3 "'<Alt>3'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.global-keybindings switch-to-workspace-4 "'<Alt>4'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.global-keybindings switch-to-workspace-5 "'<Alt>5'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.global-keybindings switch-to-workspace-6 "'<Alt>6'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.window-keybindings move-to-workspace-1 "'<Primary><Alt>1'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.window-keybindings move-to-workspace-2 "'<Primary><Alt>2'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.window-keybindings move-to-workspace-3 "'<Primary><Alt>3'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.window-keybindings move-to-workspace-4 "'<Primary><Alt>4'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.window-keybindings move-to-workspace-5 "'<Primary><Alt>5'"
replace_gsettings_default org.mate.marco.gschema.xml org.mate.Marco.window-keybindings move-to-workspace-6 "'<Primary><Alt>6'"
replace_gsettings_default org.mate.caja.gschema.xml org.mate.caja.desktop font "'DejaVu Sans 10.5'"
replace_gsettings_default org.mate.interface.gschema.xml org.mate.interface document-font-name "'DejaVu Sans 10.5'"
replace_gsettings_default org.mate.interface.gschema.xml org.mate.interface font-name "'DejaVu Sans 10.5'"
replace_gsettings_default org.mate.interface.gschema.xml org.mate.interface gtk-theme "'Blue-Submarine'"
replace_gsettings_default org.mate.interface.gschema.xml org.mate.interface icon-theme "'mate'"
replace_gsettings_default org.mate.interface.gschema.xml org.mate.interface monospace-font-name "'DejaVu Sans Mono 10.5'"
replace_gsettings_default org.mate.peripherals-mouse.gschema.xml org.mate.peripherals-mouse cursor-theme "'mate'"
replace_gsettings_default org.mate.NotificationDaemon.gschema.xml org.mate.NotificationDaemon theme "'coco'"
replace_gsettings_default org.mate.panel.gschema.xml org.mate.panel enable-program-list 'false'

glib-compile-schemas /usr/share/glib-2.0/schemas/


sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

# ignore suspend key / hibernate key / lid switch
sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

# pulseaudio streaming
echo -e "\nload-module module-switch-on-connect\nload-module module-zeroconf-discover\n" >> /etc/pulse/default.pa
systemctl enable avahi-daemon

# login manager
systemctl enable nodm.service

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default graphical.target
