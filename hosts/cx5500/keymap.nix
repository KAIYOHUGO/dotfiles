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
          esc  bck  fwd  fsc  scl  sys  brdn brup mute vold volu zzz
          grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
          caps a    s    d    f    g    h    j    k    l    ;    '    ret
          lsft z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc            ralt rmet rctl
        )

        (deflayer default
          esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11
          grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
          caps a    s    d    f    g    h    j    k    l    ;    '    ret
          lsft z    x    c    v    b    n    m    ,    .    /    rsft
          lctl @met lalt           spc            ralt rmet rctl
        )

        (deflayer func
          esc  bck  fwd  fsc  scl  sys  brdn brup mute vold volu zzz
          grv  M-1  M-2  M-3  M-4  M-5  M-6  M-7  M-8  M-9  M-0  f12  =    bspc
          tab  M-q  M-w  M-e  M-r  M-t  M-y  M-u  M-i  M-o  M-p  M-[  M-]    \
          caps M-a  M-s  M-d  M-f  M-g  M-h  M-j  M-k  M-l  M-;  M-'  ret
          lsft M-z  M-x  M-c  M-v  M-b  M-n  M-m  M-,  M-.  M-/  rsft
          lctl lmet lalt           spc            ralt rmet rctl
        )

        (defalias met (layer-while-held func))
      '';

      extraDefCfg = ''
        linux-dev /dev/input/by-path/platform-i8042-serio-0-event-kbd
        process-unmapped-keys yes
      '';
    };
  };    
}
