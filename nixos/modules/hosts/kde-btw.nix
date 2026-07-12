{ config, pkgs, inputs, ... }:

{

  imports = [
    ../../system/hardware-configuration.nix
    ../../system/system.nix
  ];

  # User
  users.users.kdelias = {
    isNormalUser = true;
    description = "Elias Schlosser";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    hashedPasswordFile = "/etc/nixos/secrets/kdelias.txt";
  };

  # Home Manager
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.kdelias = import ../../home-modules/kdelias.nix;
  };

  # Dconf
  programs.dconf.enable = true;

  # Shell (required for user shell)
  programs.fish.enable = true;

  # Gaming
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

  # Flatpak
  services.flatpak.enable = true;

  # OpenRGB
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
  };

  # Firefox
  programs.firefox = {
    enable = true;
    languagePacks= [ "de" ];
  };

  # KDE Plasma
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];
  services.displayManager.sddm = {
    enable = true;
  };

  # System packages (only system-level stuff)
  environment.systemPackages = with pkgs; [
    kitty
    stow
    obs-studio
    kdePackages.dolphin
    kdePackages.discover
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
    kdePackages.oxygen
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
    kdePackages.kamera
    zenity
    fastfetch
  ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    adwaita-fonts
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
  ];
}
