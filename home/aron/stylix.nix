{ pkgs, ... }:
{
  stylix.targets.noctalia-shell.enable = false;

  gtk.gtk4.theme = null;
}
