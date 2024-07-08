{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=#228B22,bold,underline";
    };
    shellAliases = {
      fs = "fastfetch";
      nf = "neofetch";
      set-volume = "wpctl set-volume @DEFAULT_SINK@";
    };
  };
}
