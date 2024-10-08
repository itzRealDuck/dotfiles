{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [../overlays];

  home.packages = with pkgs; [
    htop
    btop
    # discord
    (pkgs.discord.override {
      # remove any overrides that you don't want
      #  withOpenASAR = true;
      withVencord = true;
    })
    ksnip
    cinnamon.nemo-with-extensions
    neofetch
    nomacs
    prismlauncher
    nerdfonts
    xfce.thunar
    kazam
    lxappearance
    font-awesome
    pfetch
    starship
    ddnet
    fastfetch
    python3
    bluez
    blueman
    jre8
    jdk8
    kitty
    appimage-run
    wineWowPackages.full
    killall
    (pkgs.callPackage ./derivations/gnuhello.nix {}).hello
    vulkan-tools
    wofi
    swww
    rofi
    brave
    hyfetch
    (pkgs.callPackage ./derivations/compfy.nix {}).compfy
    cava
    bun
    dart-sass
    fd
    brightnessctl
    clang
    clang-tools
    valgrind
    betterdiscordctl
    minecraft
    libGL
    docker
    picom
    (pkgs.callPackage ./derivations/appimages {}).cheatbreaker
    (pkgs.callPackage ./derivations/appimages {}).badlion
    inputs.alejandra.defaultPackage.${pkgs.stdenv.hostPlatform.system}
    flatpak
  ];
  # The home.packages option allows you to install Nix packages into your
  # environment.

  # # It is sometimes useful to fine-tune packages, for example, by applying
  # # overrides. You can do that directly here, just don't forget the
  # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
  # # fonts?
  # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
}
