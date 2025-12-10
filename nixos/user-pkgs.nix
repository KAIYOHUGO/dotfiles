{
  pkgs,
  inputs,
}:
{
  cli = with pkgs; [
    zoxide
    carapace
    shadowsocks-rust
    sshfs
    steam-run
  ];

  tui = with pkgs; [
    starship
    gitui
    spotify-player
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
      inputs.wakatime-ls.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

  yazi = with pkgs; [
    yazi

    # drag-n-drop
    ripdrag

    # compression
    ouch

    # video
    mpv
  ];

  digital = with pkgs;[
    digital
    iverilog
  ];

  game = with pkgs; [
    gdlauncher
    mindustry-wayland
  ];
}
