{ config, pkgs, ... }:

{
  imports = [
    ../../system/hardware-configuration.nix
    ../../system/system.nix
  ];

  users.users.elias = {
    isNormalUser = true;
    description = "Elias Schlosser";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    hashedPasswordFile = "/etc/nixos/secrets/elias.txt";
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.elias = import ../../home-modules/elias.nix;
  };

  security.polkit = {
    enable = true;
    enablePkexecWrapper = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      # xdg-desktop-portal-gnome # only for Niri
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  programs = {
    fish.enable = true;
    dconf.enable = true;
    hyprland.enable = true;
    niri.enable = false;
    gpu-screen-recorder.enable = true;
    firefox = {
      enable = true;
      languagePacks= [ "de" ];
    };
    steam = {
      enable = true;
      gamescopeSession.enable = false;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    gamescope = {
      enable = true;
      package = pkgs.gamescope;
    };
  };

  services = {
    flatpak.enable = true;
    displayManager.defaultSession = "hyprland";
    gvfs.enable = true;
    displayManager.sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "sddm-astronaut-theme";
      wayland.enable = true;
      extraPackages = with pkgs; [
        kdePackages.qtmultimedia
        kdePackages.qtsvg
        kdePackages.qtvirtualkeyboard
        kdePackages.qtbase
      ];
    };
    hardware.openrgb = {
      enable = true;
      package = pkgs.openrgb-with-all-plugins;
      motherboard = "amd";
    };
  };

  environment.systemPackages = with pkgs; [
    noctalia
    sddm-astronaut
    swash
    kitty
    ddcutil
    obs-studio
    mpv
    killall
    libsForQt5.qt5ct
    qt6ct-kde
    gnome-themes-extra
    libnotify
    mangohud
    winetricks
    wine
    nix-search-tv
    fzf
    heroic
    hyprpicker
    vesktop
    easyeffects
    chromium
    osu-lazer-bin
    spotify
    prismlauncher
    vscodium
    git
    gimp
    imv
    cava
    btop
    cliphist
    wl-clipboard
    wl-clip-persist
    eza
    pywalfox-native
    nwg-look
    adw-gtk3
    nautilus
    file-roller
    stow
    asciiquarium-transparent
    cbonsai
    unimatrix
    kdePackages.kamera
    gnome-clocks
    decibels
    dconf-editor
    zenity
    fastfetch

    # only for Niri
    #xwayland-satellite
    #gnome-keyring
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    adwaita-fonts
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
  ];
}
