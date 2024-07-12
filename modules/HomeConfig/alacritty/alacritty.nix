{pkgs, ...}: {
  imports = [./options.nix];
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;

    # nord.enable = true;
    oxocarbon.enable = true;
  };
}
