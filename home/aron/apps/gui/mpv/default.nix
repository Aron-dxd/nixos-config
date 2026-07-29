{ pkgs, ... }:
{
  home.packages = [ pkgs.mpv ];

  xdg.configFile."mpv" = {
    source = ./config;
    recursive = true;
  };
}
