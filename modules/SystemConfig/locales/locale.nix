{
  config,
  lib,
  ...
}: let
  cfg = config.option.locale;
  inherit (lib) mkOption types;
in {
  options.option.locale = {
    default = mkOption {
      type = types.str;
      default = "en_US.UTF-8";
    };
    settings = mkOption {
      default = {
        LC_ADDRESS = "ar_EG.UTF-8";
        LC_IDENTIFICATION = "ar_EG.UTF-8";
        LC_MEASUREMENT = "ar_EG.UTF-8";
        LC_MONETARY = "ar_EG.UTF-8";
        LC_NAME = "ar_EG.UTF-8";
        LC_NUMERIC = "ar_EG.UTF-8";
        LC_PAPER = "ar_EG.UTF-8";
        LC_TELEPHONE = "ar_EG.UTF-8";
        # LC_TIME = "ar_EG.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };
    };
  };
  config = {
    i18n.defaultLocale = cfg.default;

    i18n.extraLocaleSettings =
      {
        LC_ADDRESS = "ar_EG.UTF-8";
        LC_IDENTIFICATION = "ar_EG.UTF-8";
        LC_MEASUREMENT = "ar_EG.UTF-8";
        LC_MONETARY = "ar_EG.UTF-8";
        LC_NAME = "ar_EG.UTF-8";
        LC_NUMERIC = "ar_EG.UTF-8";
        LC_PAPER = "ar_EG.UTF-8";
        LC_TELEPHONE = "ar_EG.UTF-8";
        # LC_TIME = "ar_EG.UTF-8";
        LC_TIME = "en_US.UTF-8";
      }
      // cfg.settings;
  };
}
