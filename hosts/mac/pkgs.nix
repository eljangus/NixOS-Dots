{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # core
    kitty

    # browser
    firefox
  ];
}
