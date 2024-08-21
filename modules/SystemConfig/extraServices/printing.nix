{
  config,
  lib,
  ...
}: let
  cfg = config.option.services.printing;
  inherit (lib) mkIf mkEnableOption;
in {
  options.option.services.printing = {
    enable = mkEnableOption "Enable Printing Service";
  };
  config = mkIf cfg.enable {
    # Enable CUPS to print documents.
    services.printing.enable = true;
  };
}
