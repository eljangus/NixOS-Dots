{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../system/hardware-configuration.nix
    ../../system/system.nix
  ];

  users.users.gelias = {
    isNormalUser = true;
    description = "Elias Schlosser";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    hashedPasswordFile = "/etc/nixos/secrets/gelias.txt";
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.gelias = import ../../home-modules/gelias.nix;
  };

  programs.fish.enable = true;
  programs.dconf.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = false;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs.gamescope = {
    enable = true;
    package = pkgs.gamescope;
  };
  programs.firefox = {
    enable = true;
    languagePacks= [ "de" ];
  };

  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  services.flatpak.enable = true;
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
  };

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

  fonts.packages = with pkgs; [
    noto-fonts
    adwaita-fonts
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
  ];
}
