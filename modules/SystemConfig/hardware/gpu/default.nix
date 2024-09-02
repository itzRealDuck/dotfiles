{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.option.hardware.gpu;
  inherit (lib) mkIf types mkMerge mkOption;
in {
  options.option.hardware.gpu = mkOption {
    type = types.enum ["intel" "amd" "nvidia"];
    default = "intel";
  };

  config = mkMerge [
    (mkIf (cfg == "intel") {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [intel-media-driver intel-ocl intel-vaapi-driver];
      };
      services.xserver.videoDrivers = ["modesetting"];
    })
    # Steal Settings From Aleph Cuz me have no amd gpu or nvidia gpu
    (mkIf (cfg == "amd") {
      hardware.amdgpu.opencl.enable = true;
      services.xserver.videoDrivers = ["modesetting"];

      boot = {
        initrd.kernelModules = ["amdgpu"];
        kernelModules = ["kvm-amd"];
      };

      # Vulkan and opengl stuff
      hardware.graphics = {
        enable = true;
        enable32Bit = true;

        extraPackages = with pkgs; [
          vaapiVdpau
          libvdpau-va-gl
          libva
          rocmPackages.clr
          rocmPackages.clr.icd
        ];

        extraPackages32 = with pkgs; [
          driversi686Linux.libvdpau-va-gl
        ];
      };

      environment.variables = {
        VDPAU_DRIVER = "radeonsi";
        LIBVA_DRIVER_NAME = "radeonsi";
        AMD_VULKAN_ICD = "RADV";
      };

      systemd.tmpfiles.rules = [
        "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
      ];
    })
    (mkIf (cfg == "nvidia") {
      services.xserver.videoDrivers = ["nvidia"];

      hardware = {
        nvidia = {
          modesetting.enable = true;
          nvidiaSettings = true;
          package = config.boot.linuxKernel.packages.linux_zen.nvidia_x11_vulkan_beta;
        };

        graphics = {
          enable = true;
          enable32Bit = true;
        };
      };
    })
  ];
}
