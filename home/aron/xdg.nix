{ ... }:
{
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications =
        let
          browser = [ "zen.desktop" ];
          editor  = [ "nvim.desktop" ];
          image   = [ "imv.desktop" ];
          video   = [ "mpv.desktop" ];
          files   = [ "yazi.desktop" ];
        in
        {
          # Browser
          "text/html"                = browser;
          "x-scheme-handler/http"   = browser;
          "x-scheme-handler/https"  = browser;
          "x-scheme-handler/about"  = browser;
          "x-scheme-handler/unknown" = browser;
          "application/xhtml+xml"   = browser;

          # PDF
          "application/pdf"         = browser;
          "application/x-pdf"       = browser;

          # Documents
          "application/json"        = editor;
          "application/xml"         = editor;
          "application/x-yaml"      = editor;
          "application/toml"        = editor;

          # Text / Code
          "text/plain"              = editor;
          "text/markdown"           = editor;
          "text/x-markdown"         = editor;
          "text/css"                = editor;
          "text/javascript"         = editor;
          "text/typescript"         = editor;
          "text/x-python"           = editor;
          "text/x-shellscript"      = editor;
          "text/x-sh"               = editor;
          "text/x-lua"              = editor;
          "text/x-c"                = editor;
          "text/x-c++"              = editor;
          "text/x-java"             = editor;
          "text/x-rust"             = editor;
          "text/x-go"               = editor;
          "text/x-nix"              = editor;
          "text/xml"                = editor;
          "text/csv"                = editor;
          "text/tab-separated-values" = editor;

          # Images
          "image/png"               = image;
          "image/jpeg"              = image;
          "image/jpg"               = image;
          "image/gif"               = image;
          "image/webp"              = image;
          "image/svg+xml"           = image;
          "image/bmp"               = image;
          "image/tiff"              = image;
          "image/x-icon"            = image;
          "image/avif"              = image;
          "image/heic"              = image;
          "image/heif"              = image;

          # Video
          "video/mp4"               = video;
          "video/mkv"               = video;
          "video/webm"              = video;
          "video/x-matroska"        = video;
          "video/avi"               = video;
          "video/quicktime"         = video;
          "video/x-msvideo"         = video;
          "video/x-flv"             = video;
          "video/ogg"               = video;
          "video/3gpp"              = video;
          "video/x-ms-wmv"          = video;

          # Audio — mpv handles these too
          "audio/mpeg"              = video;
          "audio/mp3"               = video;
          "audio/ogg"               = video;
          "audio/flac"              = video;
          "audio/wav"               = video;
          "audio/x-wav"             = video;
          "audio/aac"               = video;
          "audio/opus"              = video;
          "audio/webm"              = video;
          "audio/x-m4a"             = video;

          # File manager
          "inode/directory"         = files;

          # Archives — yazi handles previewing
          "application/zip"         = files;
          "application/x-tar"       = files;
          "application/x-gzip"      = files;
          "application/x-bzip2"     = files;
          "application/x-xz"        = files;
          "application/x-7z-compressed" = files;
          "application/x-rar"       = files;
          "application/zstd"        = files;
        };
    };
  };
}
