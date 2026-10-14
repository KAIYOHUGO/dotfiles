{ moduleWithSystem, ... }: {
  flake.modules.nixos.base = moduleWithSystem (
    { inputs', ... }:
    { config, pkgs, ... }:
    {
      users.users.hugo.shell = pkgs.nushell;
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
