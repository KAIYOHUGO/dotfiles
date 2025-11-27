{
  config,
  lib,
  pkgs,
}:
{
  services.kanata = {
    enable = true;
    keyboards.cx5500 = {
      config = ''
        (deflocalkeys-linux
          fwd 173
          fsc 372
          scl 120
        )
        (defsrc)
        (deflayer default)
        (defoverrides
          (bck)  (f1)
          (fwd)  (f2)
          (fsc)  (f3)
          (scl)  (f4)
          (sys)  (f5)
          (brdn) (f6)
          (brup) (f7)
          (mute) (f8)
          (vold) (f9)
          (volu) (f10)
          (zzz)  (f11)

          ;; layer
          (lmet bck)  (bck)
          (lmet fwd)  (fwd)
          (lmet fsc)  (fsc)
          (lmet scl)  (scl)
          (lmet sys)  (sys)
          (lmet brdn) (brdn)
          (lmet brup) (brup)
          (lmet mute) (mute)
          (lmet vold) (vold)
          (lmet volu) (volu)
          (lmet zzz)  (zzz)
          (lmet -)    (f12)
        )
      '';

      devices = [
        "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
      ];

      extraDefCfg = ''
        process-unmapped-keys yes
      '';
    };
  };
}
