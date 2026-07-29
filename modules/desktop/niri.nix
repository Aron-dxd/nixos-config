{ pkgs, ... }:
{
  programs.niri.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
  };

  # XDG Portal Services
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = [ "gnome" "gtk" ];
  };

  # Stop NixOS injecting a stripped PATH via the niri.service unit,
  # which otherwise shadows the home-manager-managed user PATH.
  systemd.user.services.niri.enableDefaultPath = false;

  # Thunar is installed, Nautilus isn't — force GTK file picker
  # so xdg-desktop-portal-gnome doesn't try to shell out to Nautilus.
  xdg.portal.config.niri."org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
}
