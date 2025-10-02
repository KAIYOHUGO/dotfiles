{
  config,
  lib,
  pkgs,
}: {
  services.kanata = {
    enable = true;
    keyboards.cx5500 = {
      config = ''
        (deflocalkeys-linux
          fwd 173
          fsc 372
          scl 120

        )

        (defsrc
          lmeta bck fwd fsc scl sys brdown brup mute vold volu sleep min
        )

        (deflayer default
          @lmeta f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 min
        )

        (deflayer func
          _ bck fwd fsc scl M-sys M-brdown M-brup M-mute M-vold M-volu sleep f12
        )


        (defalias lmeta (multi (layer-while-held func) rmeta))
      '';

      extraDefCfg = ''
        linux-dev /dev/input/by-path/platform-i8042-serio-0-event-kbd
      '';
    };
  };    
}
