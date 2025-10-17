{
  pkgs,
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
    oculante
  ];

  helix = with pkgs; [
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
