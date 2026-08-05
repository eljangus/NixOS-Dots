{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.myModules.programs.desktop-pkgs.enable {
    environment.systemPackages = with pkgs; [
      # media
      obs-studio
      mpv
      vesktop
      easyeffects
      spotify
      imv

      # gaming
      mangohud
      heroic
      prismlauncher

      # web
      chromium

      # creativity
      gimp

      # fun
      cava
      btop
      asciiquarium-transparent
      cbonsai
      unimatrix

      # misc
      zenity
    ];
  };
}
