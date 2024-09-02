{
  config,
  lib,
  ...
}: let
  cfg = config.option.services.xserver;
  inherit (lib) mkOption mkEnableOption mkIf types;
in {
  options.option.services.xserver = {
    enable = mkEnableOption "Enable xserver";
    xkb = {
      layout = mkOption {
        type = types.str;
        default = "us";
      };
      variant = mkOption {
        type = types.str;
        default = "";
      };
    };
  };
  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      # Configure keymap in X11
      xkb = {
        layout = cfg.xkb.layout;
        variant = cfg.xkb.variant;
      };
      # Enable touchpad support (enabled default in most desktopManager).
      # services.xserver.libinput.enable = true;
    };
  };
}
