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

        extraConfig.pipewire-pulse."99-min-quantum" = {
          "pulse.properties" = {
            "pulse.min.req" = "1024/48000";
            "pulse.default.req" = "2048/48000";
            "pulse.max.req" = "4096/48000";

            "pulse.min.frag" = "2048/48000";
            "pulse.default.frag" = "2048/48000";
            "pulse.max.frag" = "4096/48000";

            "pulse.min.quantum" = "1024/48000";
            "pulse.max.quantum" = "4096/48000";
          };
          "stream.properties" = {
            "node.latency" = "2048/48000";
          };
        };
      };
    };
}
