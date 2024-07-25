{
  lib,
  config,
  ...
}: let
  cfg = config.option.catppuccin.pointerCursor;
  inherit (lib) mkEnableOption mkIf mkOption types;
in {
  options.option.catppuccin.pointerCursor = {
    enable = mkEnableOption "Enable Catppuccin Cursors";
    flavor = mkOption {
      type = types.str;
      default = "mocha";
    };
  };
  config = mkIf cfg.enable {
    catppuccin.pointerCursor = {
      enable = true;
      flavor = cfg.flavor;
    };
  };
}
