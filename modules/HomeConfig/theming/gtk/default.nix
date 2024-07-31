{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.option.gtk;
  inherit (lib) mkEnableOption mkIf mkOption types mkMerge mkForce;
in {
  options.option.gtk = {
    enable = mkEnableOption "Enable Gtk Theme";

    theme = mkOption {
      type = types.package;
      default = pkgs.nordic;
    };
    thname = mkOption {
      type = with types; nullOr str;
      default = null;
    };
    icon = mkOption {
      type = types.package;
      default = pkgs.candy-icons;
    };
  };
  config = mkMerge [
    (mkIf cfg.enable {
      gtk = {
        enable = true;
        theme = {
          package = cfg.theme;
          name =
            if builtins.hasAttr "srcs" cfg.theme
            then let
              sorc = builtins.elemAt cfg.theme.srcs 0;
            in
              sorc.name
            else if builtins.hasAttr "src" cfg.theme
            then cfg.theme.pname
            else {};
        };
        iconTheme = {
          package = cfg.icon;
          name = "${cfg.icon.pname}";
        };
      };
    })
    (mkIf (cfg.thname != null) {
      gtk.theme.name = mkForce cfg.thname;
    })
  ];
}
