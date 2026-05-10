{ ... }:
{
  imports = [
    ./packages.nix
    ./services.nix
    ./sops.nix
    ./fonts.nix
    ./users.nix
    ./locale.nix
    ./nix.nix
  ];
}
