{ ... }:
{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./networking.nix
    ./impermanence.nix
    ./desktop
    ./system
  ];
}
