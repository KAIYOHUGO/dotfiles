{ moduleWithSystem, ... }:
{
  flake.modules.nixos.base = moduleWithSystem (
    { self', inputs', ... }:
    { config, pkgs, ... }:
    {
      programs.localsend.enable = true;

      environment.systemPackages = with pkgs; [
        sshfs
        # I hate spotify, pls fix ur API
        spotify-player
        wiremix

        self'.packages.todui
        inputs'.astuin.packages.default
        inputs'.concord.packages.default
        # concord-tui
      ];
    }
  );
}
