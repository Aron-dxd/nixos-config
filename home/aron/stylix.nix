{ lib, ... }:
{
  stylix.targets.noctalia.enable = false;

  gtk.gtk4.theme = lib.mkForce null;

  home.pointerCursor.enable = true;
}
