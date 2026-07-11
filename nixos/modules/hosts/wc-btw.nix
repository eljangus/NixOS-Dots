{ config, pkgs, inputs, ... }:

{

  imports = [
    ../../system/hardware-configuration.nix
    ../../system/system.nix
  ];

  # User
  users.users.elias = {
    isNormalUser = true;
    description = "Elias Schlosser";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    hashedPasswordFile = "/etc/nixos/secrets/elias.txt";
  };

  # Home Manager
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.elias = import ../../home-modules/elias.nix;
  };

  # Dconf
  programs.dconf.enable = true;

  # Polkit
  security.polkit = {
    enable = true;
    enablePkexecWrapper = true;
  };

  # Hyprland
  programs.hyprland.enable = false;
  programs.niri.enable = true;

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

  # Display Manager
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

  # XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      #xdg-desktop-portal-hyprland
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  # GVFS for trash support in file managers
  services.gvfs.enable = true;

  # Chromium
  programs.chromium.enable = true;

  # Firefox with pywalfox
  programs.firefox = {
    enable = true;
    languagePacks= [ "de" ];
  };

  # OBS for screen recording
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-gstreamer
      obs-vkcapture
    ];
    package = pkgs.obs-studio.override {
      cudaSupport = true;
    };
  };

  # GPU screen recorder
  programs.gpu-screen-recorder.enable = true;

  # System packages (only system-level stuff)
  environment.systemPackages = with pkgs; [
    (sddm-astronaut.override { embeddedTheme = "purple_leaves"; })
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    kitty
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
    satty
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
    blueman
    zenity
    fastfetch

    # Hyprland specific

    # Niri specific
    xwayland-satellite
    gnome-keyring
  ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    adwaita-fonts
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
  ];
}
