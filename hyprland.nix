{ pkgs, ... }:
let
  catppuccinRepo = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "hyprland";
    rev = "v1.3";
    hash = "sha256-jkk021LLjCLpWOaInzO4Klg6UOR4Sh5IcKdUxIn7Dis=";
  };
in
{

  home.packages = with pkgs; [
    hyprshot
  ];

  xdg.configFile."hypr" = {
  source = ./config;
  recursive = true;
  };

  xdg.configFile."hypr/mocha.conf".source = "${catppuccinRepo}/themes/mocha.conf";
}