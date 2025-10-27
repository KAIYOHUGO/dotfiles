{
  pkgs,
  inputs,
}:
{
  tui = with pkgs; [
    zoxide
    starship
    gitui
    spotify-player
    shadowsocks-rust
    todui
  ];

  gui = with pkgs; [
    vesktop
    chromium
    insomnia
    popsicle
    parsec-bin
    obsidian
    vscode.fhs
    zed-editor
    oculante
    yaak-patch
  ];

  helix =
    with pkgs;
    [
      # rust
      rust-analyzer

      # typst
      tinymist
      typstyle

      # c/c++
      llvmPackages_21.clang-tools

      # toml
      taplo

      # nix
      nil

      # discord
      discord-rpc-lsp
    ]
    ++ [
      # wakatime
      inputs.wakatime-ls.packages.${pkgs.system}.default
    ];

  yazi = with pkgs; [
    yazi
    ripdrag
    ouch
  ];

  game = with pkgs; [
    gdlauncher
  ];
}
