{ pkgs, ... }:
let
  niri-cast-indicator = pkgs.buildGoModule {
    pname = "niri-cast-indicator";
    version = "unstable";
    src = pkgs.fetchFromGitHub {
      owner = "fabienjuif";
      repo = "niri-cast-indicator";
      rev = "main"; # pin to a real commit hash once confirmed
      hash = "sha256-ICPvur3RsdoAhGE8ZfT+C3bj/8JCjcE62CS3gUfzKQs=";
    };
    vendorHash = null;
  };
in
{
  home.packages = [ niri-cast-indicator ];
}
