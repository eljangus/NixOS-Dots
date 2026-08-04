{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # core
    imv
    zenity

    # media
    obs-studio
    vesktop
    easyeffects
    spotify

    # desktop applications
    mpv
    gnome-tweaks
    gnome-extension-manager

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
}
