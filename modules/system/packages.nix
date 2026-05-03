{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Essentials
    git
    vim
    wget
    curl
    btop
    pciutils
    usbutils

    # System Specific
    cloudflare-warp
    bibata-cursors

    # Global Packages
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
