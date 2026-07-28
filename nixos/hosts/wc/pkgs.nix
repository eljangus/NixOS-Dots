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
    killall
    libsForQt5.qt5ct
    gnome-themes-extra
    libnotify
    winetricks
    wine
    nix-search-tv
    fzf
    cabextract # for heroic
    p7zip # for heroic
    eza
    hyprpicker
    cliphist
    wl-clipboard
    wl-clip-persist
    stow
    kdePackages.kamera
    dconf-editor
    zenity
    fastfetch

    # media
    obs-studio
    mpv
    vesktop
    easyeffects
    spotify
    imv

    # texteditor
    vscodium

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
