{ moduleWithSystem, ... }:
{
  flake.modules.nixos.base = moduleWithSystem (
    { inputs', ... }:
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      environment.systemPackages = [
        pkgs.tomat
        inputs'.cosmic-tomat.packages.default
      ];

      systemd.user.services.tomat = {
        unitConfig = {
          Description = "Tomat Pomodoro server";
          After = [ "graphical.target" ];
        };

        serviceConfig = {
          ExecStart = "${lib.getExe pkgs.tomat} daemon run";
          Restart = "always";
          RestartSec = 5;
        };

        wantedBy = [ "default.target" ];
      };
    }
  );
}
