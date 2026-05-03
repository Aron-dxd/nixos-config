{ ... }:
{
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications =
        let
          browser = [ "zen-beta.desktop" ];
          editor = [ "nvim.desktop" ];
          image = [ "imv.desktop" ];
          video = [ "mpv.desktop" ];
          file = [ "mpv.desktop" ];
        in
        {
          "text/html" = browser;
          "x-scheme-handler/http" = browser;
          "x-scheme-handler/https" = browser;
          "application/pdf" = browser;
          "application/json" = browser;
          "text/plain" = editor;
          "inode/directory" = file;
          "image/*" = image;
          "video/*" = video;
        };
    };
  };
}
