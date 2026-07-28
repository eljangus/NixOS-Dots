{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xwayland-satellite # Niri only
    gnome-keyring # Niri only
  ];
}
