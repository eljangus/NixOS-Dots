{ config, lib, pkgs, ... }:

{
  config = lib.mkIf (config.myModules.desktop == "niri") {
    programs.niri.enable = true;

    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
 
    services.gnome.gnome-keyring.enable = true;
    services.displayManager.defaultSession = "niri";
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

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];
    };
  };
}
