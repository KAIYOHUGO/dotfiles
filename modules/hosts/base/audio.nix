{
  flake.modules.nixos.base =
    { config, pkgs, ... }:
    {
      hardware.firmware = with pkgs; [
        sof-firmware
        alsa-firmware
      ];

      services.pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;

        # https://www.reddit.com/r/Fedora/comments/vkun2m/anyone_else_having_issues_with_the_recent/
        # Thx @_mb
        extraConfig.pipewire."99-min-quantum" = {
          "context.properties" = {
            "default.clock.quantum" = 4096;
            "default.clock.min-quantum" = 2048;
            "default.clock.max-quantum" = 8192;
          };
        };
      };
    };
}
