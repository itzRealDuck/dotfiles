{
  pkgs,
  config,
  options,
  ...
}: {
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;

    oxocarbon.enable = true;
    # catppuccin = {
    #  enable = true;
    # };
    # settings = {
    #  colors = {
    #   primary.background = "#171717";
    #};
  };
  # };
}
