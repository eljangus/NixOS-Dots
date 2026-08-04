#! /bin/sh

mkdir ~/.local/state/noctalia
mkdir ~/.config/VSCodium/User
sleep 0.5
cp ~/NixOS-Dots/misc/settings/settings.toml ~/.local/state/noctalia/settings.toml
sleep 0.2
dconf write /org/gnome/desktop/wm/preferences/button-layout "''"
