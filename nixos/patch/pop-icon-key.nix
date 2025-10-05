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
        (deflayer default)
        (defoverrides
          (lmet l) (zzz)
          (lmet lsft s) (sys)
        )
      '';

      extraDefCfg = ''
        linux-dev-names-include ("POP Icon Keys")
        process-unmapped-keys yes
      '';
    };
  };
}
