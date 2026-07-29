{ ... }:

{
  programs = {
    fish = {
      shellAliases = {
        nrs = "nh os switch ~/NixOS-Dots/nixos#gnome";
        nrb = "nh os boot ~/NixOS-Dots/nixos#gnome";
      };
    };
  };
}
