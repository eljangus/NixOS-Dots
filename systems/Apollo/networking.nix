{...}: {
  networking = {
    hostName = "Apollo";
    networkmanager.enable = true;
    firewall.enable = true;
  };
}
