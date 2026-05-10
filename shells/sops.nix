{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  name = "SOPS";
  packages = with pkgs; [
    pkgs.sops
    pkgs.ssh-to-age
    pkgs.age
  ];

  shellHook = ''
    export SOPS_AGE_KEY=$(ssh-to-age --private-key < /persist/home/aron/.ssh/sops-nix)
    echo "sops envrionment ready"
  '';
}
