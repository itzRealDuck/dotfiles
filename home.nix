{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  imports = [
    ./modules/HomeConfig
    ./hosts
  ];
  home = {
    username = "itzreakduck";
    homeDirectory = "/home/itzreakduck";
    # DO NOT CHANGE VALUE!!
    stateVersion = "23.05";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #

  # The home.packages option allows you to install Nix packages into your
  # environment.

  # # You can also create simple shell scripts directly inside your
  # # configuration. For example, this adds a command 'my-hello' to your
  # # environment:
  # (pkgs.writeShellScriptBin "my-hello" ''
  #   echo "Hello, ${config.home.username}!"
  # '')

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.

  #Let Home Manager install and manage itself.
  programs.home-manager.enable = false;
}
