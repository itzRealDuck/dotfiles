{
  pkgs,
  lib,
  config,
  options,
  ...
}: let
in {
  imports = [(import ./options.nix {inherit pkgs lib config options;})];
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;

    # nord.enable = true;
    oxocarbon.enable = true;
  };
}
