{
  config,
  lib,
  ...
}: let
  cfg = config.option.timezone;
  inherit (lib) mkOption types;
in {
  options.option.timezone = mkOption {
    type = types.str;
    default = "Africa/Cairo";
  };
  config = {
    time.timeZone = cfg;
  };
}
