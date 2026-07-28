{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # core 
    stow    
    winetricks
    wine
    nix-search-tv
    fzf
    killall
    imv
    eza
    zenity
    fastfetch
    
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
