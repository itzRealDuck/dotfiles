{
  config,
  lib,
  ...
}: let
  cfg = config.option.gaming;
  inherit (lib) mkIf mkEnableOption;
in {
  options.option.gaming = {
    enable = mkEnableOption "Enable Gaming Apps";
    steam = mkEnableOption "Enable Steam (Enabled By Default)" // {default = true;};
  };
  config = mkIf cfg.enable {
    programs.steam.enable = cfg.steam;
  };
}
