{
  config,
  lib,
  ...
}: let
  cfg = config.option.virtualization.waydroid;
  inherit (lib) mkIf mkEnableOption;
in {
  options.option.virtualization.waydroid = {
    enable = mkEnableOption "Enable Waydroid";
  };
  config = mkIf cfg.enable {
    virtualisation.waydroid.enable = true;
  };
}
