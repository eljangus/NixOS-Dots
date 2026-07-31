{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # overlay Packages
    noctalia
    sddm-astronaut
    swash
    qt6ct-kde

    # core
    kitty
    ddcutil
    libsForQt5.qt5ct
    gnome-themes-extra
    libnotify
    cabextract # for heroic
    p7zip # for heroic
    hyprpicker
    cliphist
    wl-clipboard
    wl-clip-persist
    kdePackages.kamera
    dconf-editor
    zenity

    # media
    obs-studio
    mpv
    vesktop
    easyeffects
    spotify
    imv

    # Gaming
    mangohud
    heroic
    osu-lazer-bin
    prismlauncher

    # web
    chromium

    # creativity
    gimp

    # fun
    cava
    btop
    asciiquarium-transparent
    cbonsai
    unimatrix

    # theming
    pywalfox-native
    nwg-look
    adw-gtk3

    # desktop applications
    nautilus
    file-roller
    gnome-clocks
    decibels
  ];
}
