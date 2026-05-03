{ pkgs, ... }:
{
  # Hyprland System Daemon
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Wayland Specific Variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # XDG Portal Services
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = [ "hyprland" "gtk" ];
  };
}
