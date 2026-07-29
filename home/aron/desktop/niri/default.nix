{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    xwayland-satellite
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  home.activation.linkScreencastConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p $HOME/.local/share/niri
    touch $HOME/.local/share/niri/screencast.kdl
    ln -sfn $HOME/.local/share/niri/screencast.kdl $HOME/.config/niri/screencast.kdl
  '';
}
