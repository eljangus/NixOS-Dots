{ pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./nixpkgs/config.nix
    ./services/xserver/xkb.nix
    ./services/xserver/amdgpu.nix
    ./environment/sessionVariables.nix
    ./services/services.nix
    ./environment/sessionVariables.nix
    ./hardware/hardware.nix
    ./nixpkgs/overlays/default.nix
    ./desktops/gnome.nix
    ./desktops/niri.nix
    ./desktops/hyprland.nix
    ./desktops/plasma6.nix
    ./security/polkit.nix
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

  console.keyMap = "de";

  documentation.nixos.enable = false;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  fonts.packages = with pkgs; [
    noto-fonts
    adwaita-fonts
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
  ];
}
