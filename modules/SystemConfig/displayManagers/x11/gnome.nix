{
  config,
  lib,
  ...
}: let
  cfg = config.option.de.gnome;
  inherit (lib) mkIf mkEnableOption;
in {
  options.option.de.gnome = {
    enable = mkEnableOption "Enable Gnome Desktop Manager";
  };
  config = mkIf cfg.enable {
    services.xserver = {
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
    };
  };
}
