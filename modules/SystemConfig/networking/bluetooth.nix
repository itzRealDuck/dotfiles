{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.option.network.bluetooth;
  inherit (lib) mkEnableOption mkIf mkOption types;
in {
  options.option.network.bluetooth = {
    enable = mkEnableOption "Enable Bluetooth";
    powerOnBoot = mkOption {
      type = types.bool;
      default = true;
    };
  };
  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = cfg.powerOnBoot;
    services.blueman.enable = true;
  };
  # hardware.bluetooth.enable = true;
  #hardware.bluetooth.powerOnBoot = true;
  #services.blueman.enable = true;
}
