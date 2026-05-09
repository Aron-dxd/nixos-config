{ pkgs, ... }:
{
  stylix.targets.noctalia-shell.enable = false;

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk4.theme = null;
  };
}
