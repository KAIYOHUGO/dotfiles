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

        self'.packages.yaak
        oculante

        digital
        iverilog
        xournalpp
      ];
    }
  );

}
