{ config, pkgs, inputs, ... }:

{

  imports = [
    ../../system/hardware-configuration.nix
    ../../system/system.nix
  ];

  # Users
  users.users.gelias = {
    isNormalUser = true;
    description = "Elias Schlosser";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    hashedPasswordFile = "/etc/nixos/secrets/gelias.txt";
  };

  # Home Manager
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.gelias = import ../../home-modules/gelias.nix;
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

  # GNOME
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;

  # System packages (only system-level stuff)
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

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    adwaita-fonts
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
  ];
}
