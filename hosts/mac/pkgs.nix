{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # core
    kitty
    cava
    btop
    python3

    # browser
    firefox
  ];
}
