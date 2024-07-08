{pkgs, ...}: {
  networking.hostName = "nixos"; # hostname
  #  networking.wireless.enable = true; enable wirless
  networking.networkmanager.enable = true;
  # extra options
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Disable firewall
  # networking.firewall.enable = false;
}
