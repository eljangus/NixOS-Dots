{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../system/hardware-configuration.nix
    ../../system/system.nix
  ];

  users.users.kdelias = {
    isNormalUser = true;
    description = "Elias Schlosser";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    hashedPasswordFile = "/etc/nixos/secrets/kdelias.txt";
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.kdelias = import ../../home-modules/kdelias.nix;
  };

  programs = {
    fish.enable = true;
    dconf.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = false;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gamescope = {
      enable = true;
      package = pkgs.gamescope;
    };
    firefox = {
      enable = true;
      languagePacks= [ "de" ];
    };
  };

  services = {
    flatpak.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
    };
    hardware.openrgb = {
      enable = true;
      package = pkgs.openrgb-with-all-plugins;
      motherboard = "amd";
    };
  };

  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
    ];
    systemPackages = with pkgs; [
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
  };

  fonts.packages = with pkgs; [
    noto-fonts
    adwaita-fonts
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
  ];
}
