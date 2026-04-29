{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xdg-utils
  ];

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications =
        let
          browser = [ "zen-beta.desktop" ];
          editor  = [ "nvim.desktop" ];
          image   = [ "imv.desktop" ];
        in {
          "text/html"                = browser;
          "x-scheme-handler/http"   = browser;
          "x-scheme-handler/https"  = browser;
          "application/pdf"         = browser;
          "application/json"        = browser;
          "text/plain"              = editor;
          "inode/directory"         = [ "thunar.desktop" ];
          "image/*"                 = image;
          "video/*"                 = [ "mpv.desktop" ];
        };
    };
  };
}