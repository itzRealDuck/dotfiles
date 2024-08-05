{
  config,
  lib,
  ...
}: let
  cfg = config.option.hardware.cpu;
  inherit (lib) mkOption mkIf mkMerge types;
in {
  options.option.hardware.cpu = mkOption {
    type = types.enum ["intel" "amd"];
    default = "intel";
  };
  config = mkMerge [
    (mkIf (cfg == "intel") {
      hardware.cpu.intel.updateMicrocode = true;
    })
    (mkIf (cfg == "amd") {
      hardware.cpu.amd.updateMicrocode = true;
    })
  ];
}
