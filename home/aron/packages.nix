{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # System and control
    brightnessctl
    jq

    # Media and Downloads
    ffmpeg

    # Desktop and Utilities
    wl-clipboard
    wtype

    # Productivity and Information
    thunar
  ];

  programs = {
    # Shell and Terminal

    # CLI tools
    bat.enable = true;
    lsd.enable = true;

    # Media
    mpv.enable = true;
    imv.enable = true;
    yt-dlp.enable = true;
    satty.enable = true;

    # Development

    # Secrets
    keepassxc.enable = true;

    # Hyprland
    hyprshot = {
      enable = true;
      saveLocation = "${config.home.homeDirectory}/Pictures/Screenshots";
    };

    home-manager.enable = true;
  };

  services = {
    playerctld.enable = true;
  };
}
