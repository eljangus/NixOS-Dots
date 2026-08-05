{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # desktop applications
    gnome-tweaks
    gnome-extension-manager
  ];
}
