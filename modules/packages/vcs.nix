{
  flake.modules.nixos.base =
    { config, pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        gh

        # git
        git
        gitui

        # jj
        jujutsu
        lazyjj
      ];
    };
}
