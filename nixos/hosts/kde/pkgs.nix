{ pkgs, ... }:

{
 environment = {
  plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];
  systemPackages = with pkgs; [
    # core
    kitty
    stow
    winetricks
    wine
    nix-search-tv
    fzf
    killall
    kdePackages.oxygen
    imv
    eza
    kdePackages.kamera
    zenity
    fastfetch

    # media
    obs-studio
    vesktop
    easyeffects
    spotify

    # desktop applications
    kdePackages.dolphin
    kdePackages.discover
    mpv

    # gaming
    mangohud
    heroic
    prismlauncher

    # web
    chromium

    # texteditor
    vscodium

    # creativity
    gimp

    # fun
    cava
    btop
    asciiquarium-transparent
    cbonsai
    unimatrix
    ];
  };
}
