{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.option.gtk;
  inherit (lib) mkEnableOption mkIf;
in {
  options.option.gtk = {
    enable = mkEnableOption "Enable Gtk Theme";
  };
  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      theme = {
        package = pkgs.nordic;
        name = "Nordic";
      };
      iconTheme = {
        package = pkgs.candy-icons;
        name = "candy-icons";
      };
    };
  };
}
