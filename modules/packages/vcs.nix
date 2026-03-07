{
  flake.modules.nixos.base =
    { config, pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        gh
        gitui
        git
        jujutsu
      ];
    };
}
