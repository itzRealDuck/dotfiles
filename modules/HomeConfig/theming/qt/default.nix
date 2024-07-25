{
  lib,
  config,
  ...
}: let
  cfg = config.option.qt;
  inherit (lib) mkEnableOption mkIf;
in {
  options.option.qt = {
    enable = mkEnableOption "Enable Qt Theme";
  };
  config = mkIf cfg.enable {
    qt = {
      enable = true;
      style.name = "kvantum";
      platformTheme.name = "kvantum";
      style = {
        catppuccin = {
          enable = true;
        };
      };
    };
  };
}
