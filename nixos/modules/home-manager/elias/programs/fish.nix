{...}: {
  programs = {
    fish = {
      shellAliases = {
        nrs = "nh os switch ~/NixOS-Dots/nixos#wc";
        nrb = "nh os boot ~/NixOS-Dots/nixos#wc";
      };
    };
  };
}
