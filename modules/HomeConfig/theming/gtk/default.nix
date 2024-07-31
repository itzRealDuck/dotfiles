{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.option.gtk;
  inherit (lib) mkEnableOption mkIf mkOption types;
in {
  options.option.gtk = {
    enable = mkEnableOption "Enable Gtk Theme";

    theme = mkOption {
      type = types.package;
      default = pkgs.nordic;
    };
    icon = mkOption {
      type = types.package;
      default = pkgs.candy-icons;
    };
  };
  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      theme = {
        package = cfg.theme;
        name = "${cfg.theme.pname}";
      };
      iconTheme = {
        package = cfg.icon;
        name = "${cfg.icon.pname}";
      };
    };
  };
}
