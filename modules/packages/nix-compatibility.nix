{
  flake.modules.nixos.base =
    {
      config,
      pkgs,
      ...
    }:
    {
      programs.nix-ld = {
        enable = true;
        libraries = pkgs.steam-run.args.multiPkgs pkgs;
      };
      environment.systemPackages = with pkgs; [
        steam-run
      ];
    };
}
