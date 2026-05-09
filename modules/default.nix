{ ... }:
{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./networking.nix
    ./impermanence.nix
    ./stylix.nix
    ./desktop
    ./system
  ];
}
