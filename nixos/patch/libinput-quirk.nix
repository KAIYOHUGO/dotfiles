{
  config
}:{
    environment.etc."libinput/local-overrides.quirks".text = ''
      [Kanata]
      MatchName=kanata-external
      AttrKeyboardIntegration=external
    '';
  }
