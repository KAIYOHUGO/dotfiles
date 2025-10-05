{
  config,
  lib,
  pkgs,
}:
{
  services.kanata = {
    enable = true;
    keyboards.pop-icon-key = {
      config = ''
        (defsrc)
        (deflayermap (default)
          M-l zzz
          M-S-s sys
        )
      '';

      extraDefCfg = ''
        linux-dev-names-include ("POP Icon Keys")
      '';
    };
  };
}
