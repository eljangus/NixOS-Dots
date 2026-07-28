{ config, ... }:

{
  nixpkgs.config = {
    permittedInsecurePackages = [
    ];
    allowUnfree = true;
  };
}
