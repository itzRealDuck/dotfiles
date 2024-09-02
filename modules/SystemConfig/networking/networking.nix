{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.option.network;
  inherit (lib) mkEnableOption mkIf mkOption types;
in {
  options.option.network = {
    enable = mkEnableOption "enable networkworking";

    wireless.enable = mkEnableOption "enable wireless networking";
    name = mkOption {
      type = types.str;
      default = "nixos";
    };
  };
  config = mkIf cfg.enable {
    networking = {
      networkmanager.enable = mkIf (cfg.wireless.enable == false) true;
      hostName = cfg.name;
      wireless.enable = cfg.wireless.enable;
    };
  };
  # extra options
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Disable firewall
  # networking.firewall.enable = false;
}
