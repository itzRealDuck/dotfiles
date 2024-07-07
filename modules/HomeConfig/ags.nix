{
  inputs,
  pkgs,
  options,
  ...
}:
with options; {
  imports = [
    inputs.ags.homeManagerModules.default
  ];
  programs.ags = {
    enable = true;

    configDir = null;

    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
}
