{
  flake.modules.nixos.base =
    { config, pkgs, ... }:
    {
      networking.networkmanager.plugins = with pkgs; [
        networkmanager-openconnect
      ];
      environment.systemPackages = with pkgs; [
        shadowsocks-rust
      ];
    };
}
