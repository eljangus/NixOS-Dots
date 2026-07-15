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

  programs.dconf.enable = true;

  security.polkit = {
    enable = true;
    enablePkexecWrapper = true;
  };

  programs.hyprland.enable = false;
  programs.niri.enable = true;

  programs.fish.enable = true;

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

  services.flatpak.enable = true;

  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
  };

  services.displayManager.sddm = {
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
  services.displayManager.defaultSession = "niri";

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  services.gvfs.enable = true;

  programs.firefox = {
    enable = true;
    languagePacks= [ "de" ];
  };

  programs.gpu-screen-recorder.enable = true;

  environment.systemPackages = with pkgs; [
    noctalia
    sddm-astronaut
    waytator
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
    vesktop
    heroic
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
    hyprpicker
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
    xwayland-satellite
    gnome-keyring
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    adwaita-fonts
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
  ];
}
