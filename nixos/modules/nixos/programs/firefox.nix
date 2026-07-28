{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = [ "de" ];
  };
}
