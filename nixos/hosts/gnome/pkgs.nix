{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    stow
    obs-studio
    mpv
    killall
    mangohud
    winetricks
    wine
    nix-search-tv
    fzf
    vesktop
    heroic
    chromium
    gnome-tweaks
    gnome-extension-manager
    easyeffects
    spotify
    prismlauncher
    vscodium
    git
    gimp
    imv
    cava
    btop
    hyprpicker
    eza
    asciiquarium-transparent
    cbonsai
    unimatrix
    zenity
    fastfetch
  ];
}
