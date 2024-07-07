{
  pkgs,
  options,
  inputs,
  ...
}:
with options; {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    neovim
    git
    wezterm
    gcc
    rustup
    chromium
    pavucontrol
    inputs.quickshell.packages.${pkgs.system}.default
  ];
}
