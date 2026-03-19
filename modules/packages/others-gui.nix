{ moduleWithSystem, ... }:
{
  flake.modules.nixos.base = moduleWithSystem (
    {self',...}:
    { config, pkgs, ... }:
    {
      programs.direnv.enable = true;

      environment.systemPackages = with pkgs; [
        vesktop
        parsec-bin
        oculante

        oculante

        digital
        iverilog
        xournalpp

        
        # self'.packages.yaak
        yaak
        self'.packages.gdlauncher
      ];
    }
  );

}
