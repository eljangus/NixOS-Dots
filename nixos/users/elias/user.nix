{ pkgs, ... }:

{
  users.users.elias = {
    isNormalUser = true;
    description = "Elias Schlosser";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    hashedPasswordFile = "/etc/nixos/secrets/elias.txt";
  };
}
