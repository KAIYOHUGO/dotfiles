{ moduleWithSystem, ... }: {
  flake.modules.nixos.base = moduleWithSystem (
    { inputs', ... }:
    { config, pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nushell
        wezterm
        bottom
        trash-cli
        zoxide
        carapace
        atuin
        starship
        nh
      ];
    }
  );
}
