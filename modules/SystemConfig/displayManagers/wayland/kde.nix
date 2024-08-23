{
  config,
  lib,
  ...
}: let
  cfg = config.option.de.kde;
  inherit (lib) mkEnableOption mkIf;
in {
  options.option.de.kde = {
    enable = mkEnableOption "Enable Kde Desktop Manager";
  };
  config = mkIf cfg.enable {
    services.desktopManager = {
      plasma6 = {
        enable = true;
      };
    };
  };
}
