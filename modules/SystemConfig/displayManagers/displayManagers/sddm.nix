{
  config,
  lib,
  ...
}: let
  cfg = config.option.dm.sddm;
  inherit (lib) mkIf mkEnableOption;
in {
  options.option.dm.sddm = {
    enable = mkEnableOption "Enable Sddm Display Manager";
    ctp = {
      enable = mkEnableOption "Enable Ctp Theme For Sddm Display Manager" // {default = true;};
    };
  };
  config = mkIf cfg.enable {
    services.displayManager = {
      sddm = {
        enable = true;
        catppuccin = {
          enable = cfg.ctp.enable;
        };
      };
    };
  };
}
