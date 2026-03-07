{
  flake.modules.nixos.base =
    {
      config,
      ...
    }:
    {
      environment.etc."libinput/kanata-external.quirks".text = ''
        [Kanata]
        MatchName=kanata-external
        AttrKeyboardIntegration=external
      '';
    };
}
