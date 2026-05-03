{ pkgs, ... }:
{
  # Set Catppuccin Theme globally
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;

  # Set Catppuccin for Hyprland
  catppuccin.hyprland.enable = true;

  # Set GTK themeing
  gtk = {
    enable = true;
    gtk4.theme = null;
    theme = {
      name = "catppuccin-mocha-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "standard";
        variant = "mocha";
      };
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  home.sessionVariables = {
    GTK_THEME = "catppuccin-mocha-mauve-standard";
  };
}
