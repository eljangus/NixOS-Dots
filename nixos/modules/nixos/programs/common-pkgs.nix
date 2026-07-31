{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.myModules.programs.common-pkgs.enable {
    environment.systemPackages = with pkgs; [
      # core
      killall
      winetricks
      wine
      nix-search-tv
      fzf
      eza
      stow
      fastfetch
      python3

      # texteditor
      vscodium
    ];
  };
}
