{
  lib,
  config,
  ...
}: let
  cfg = config.option.qt;
  inherit (lib) mkEnableOption mkIf mkOption types mkMerge;
in {
  options.option.qt = {
    enable = mkEnableOption "Enable Qt Theme";

    package = mkOption {
      type = with types; nullOr package;
      default = null;
    };
    ctp = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };
      flavor = mkOption {
        type = types.str;
        default = "mocha";
      };
    };
  };
  config = mkMerge [
    (mkIf cfg.enable {
      qt = {
        enable = true;
        style.name = "kvantum";
        platformTheme.name = "kvantum";
      };
    })
    (mkIf (cfg.package
      != null) {
      qt.style.package = cfg.package;
      qt.style.name = "${cfg.package.pname}";
      qt.platformTheme.name = "${cfg.package.pname}";
    })
    (mkIf cfg.ctp.enable {
      qt = {
        style = {
          catppuccin = {
            enable = true;
            inherit (cfg.ctp) flavor;
          };
        };
      };
    })
  ];
}
