{ pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./xkb.nix
    ./amdgpu.nix
    ./services.nix
    ./hardware.nix
    ./overlays/default.nix
    ./desktops/gnome.nix
    ./desktops/niri.nix
    ./desktops/hyprland.nix
    ./desktops/plasma6.nix
    ./polkit.nix
    ./nix.nix
  ];

  time.timeZone = "Europe/Berlin";
  i18n = {
    defaultLocale = "de_DE.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  zramSwap.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  console.keyMap = "de";
  documentation.nixos.enable = false;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  nixpkgs.config = {
    permittedInsecurePackages = [
    ];
    allowUnfree = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    adwaita-fonts
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
  ];
}
