{
  flake.modules.nixos.base =
    { config, ... }:
    {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nixpkgs.config.allowUnfree = true;

      networking.networkmanager.enable = true;

      # Set your time zone.
      time.timeZone = "Asia/Taipei";
      i18n.defaultLocale = "en_US.UTF-8";
      users.users.hugo = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      };

      services.libinput.enable = true;

      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };

      # for flake (clash)
      nix.settings = {
        trusted-users = [ "@wheel" ];
      };

      system.stateVersion = "25.11";
    };

}
