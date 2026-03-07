{ moduleWithSystem, ... }:
{
  flake.modules.nixos.base = moduleWithSystem (
    { self', ... }:
    { config, pkgs, ... }:
    {
      programs.localsend.enable = true;

      environment.systemPackages = with pkgs; [
        sshfs
        # I hate spotify, pls fix ur API
        spotify-player
        self'.packages.todui
        wiremix
      ];
    }
  );
}
