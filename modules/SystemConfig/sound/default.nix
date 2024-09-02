{
  config,
  lib,
  ...
}: let
  cfg = config.option.sound;
  inherit (lib) mkEnableOption mkIf;
in {
  options.option.sound = {
    enable = mkEnableOption "Enable PulseAudio/Pipewire(Default)";
    pulseaudio.enable = mkEnableOption "Enable PulseAudio Alone";
    pipewire.enable = mkEnableOption "Enable Pipewire" // {default = true;};
  };
  # Enable sound with pipewire.
  config = mkIf cfg.enable {
    hardware.pulseaudio.enable = cfg.pulseaudio.enable;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = cfg.pipewire.enable;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };
}
