{
  flake.modules.nixos.base =
    { config, pkgs, ... }:
    {
      services.displayManager.cosmic-greeter.enable = true;
      services.desktopManager.cosmic.enable = true;
      services.desktopManager.cosmic.xwayland.enable = true;
      environment.systemPackages = with pkgs; [
        cosmic-store
        wl-clipboard
      ];
    };
}
