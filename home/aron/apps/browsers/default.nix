{ config, ... }:

{
  # 1. Profiles.ini
  home.file.".zen/profiles.ini".text = ''
    [Profile0]
    Name=aron.default
    IsRelative=1
    Path=aron.default
    Default=1

    [General]
    StartWithLastProfile=1
    Version=2
  '';

  # Static System Settings
  home.file.".zen/aron.default/user.js".source = 
    config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/aron/apps/browser/user.js";

  # Chrome Folder (CSS/Catppuccin Mocha files)
  home.file.".zen/aron.default/chrome".source = 
    config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/aron/apps/browser/chrome";

  # Preferences (Pins, Essentials, Zen Addons, Colour Scheme)
  home.file.".zen/aron.default/prefs.js".source = 
    config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/aron/apps/browser/prefs.js";

  # Extensions Registry
  home.file.".zen/aron.default/extensions.json".source = 
    config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/aron/apps/browser/extensions.json";
}
