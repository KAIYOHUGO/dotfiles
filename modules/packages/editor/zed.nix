{
  flake.modules.nixos.base =
    { config, pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        zed-editor
      ];
    };
}
