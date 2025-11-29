{
  config,
}:
{
  # https://unix.stackexchange.com/a/684582
  # thanks
  xdg.mime.defaultApplications = {
    "image/png" = "oculante.desktop";
    "image/jpeg" = "oculante.desktop";

    "application/pdf" = "firefox.desktop";

    "text/plain" = "Helix.desktop";
  };
}
