{pkgs, ...}: {
  users.users.itzreakduck = {
    isNormalUser = true;
    description = "ItzReakDuck";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      firefox
      #  thunderbird
    ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
}
