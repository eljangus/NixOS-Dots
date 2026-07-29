{ config, lib, self, pkgs, ... }:

{
  config = lib.mkIf (config.myModules.desktop == "hyprland") {
    programs.hyprland.enable = true;

    services.displayManager.defaultSession = "hyprland";
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
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
    };
  };
}
