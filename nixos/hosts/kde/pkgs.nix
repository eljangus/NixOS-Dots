{ pkgs, ... }:

{
 environment = {
  plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];
  systemPackages = with pkgs; [
    # core
    kitty
    kdePackages.oxygen
    imv
    kdePackages.kamera
    zenity

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
