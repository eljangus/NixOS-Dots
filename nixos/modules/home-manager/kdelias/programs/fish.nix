{...}: {
  programs = {
    fish = {
      shellAliases = {
        nrs = "nh os switch ~/NixOS-Dots/nixos#kde";
        nrb = "nh os boot ~/NixOS-Dots/nixos#kde";
      };
    };
  };
}
