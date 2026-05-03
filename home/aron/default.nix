{ ... }:
{
  imports = [
    ./packages.nix
    ./xdg.nix
    ./theme.nix
    ./apps
    ./desktop
  ];

  home.username = "aron";
  home.homeDirectory = "/home/aron";

  home.stateVersion = "25.11";
}
