{ config, pkgs, ... }:

{
  home.file.".config/hexchat/addons/ssclient.py" = {
    source = ./ssclient.py;
  };

  programs.hexchat = {
    enable = true;
    overwriteConfigFiles = true;

    settings = {
      dcc_auto_recv   = "2";
      dcc_dir         = "/home/aron/Downloads/ebooks";
      dcc_auto_resume = "1";

      irc_nick1       = "arnn019";
      irc_nick2       = "arnn019_";
      irc_nick3       = "arnn019__";
      irc_user_name   = "arnn019";
      irc_real_name   = "arnn019";

      gui_slist_skip  = "1";
      gui_quit_dialog = "0";
    };

    channels."IRCHighway" = {
      autojoin = [ "#ebooks" ];
      servers  = [ "irc.irchighway.net" ];

      options = {
        autoconnect                  = true;
        forceSSL                     = false;
        useGlobalUserInformation     = true;
        connectToSelectedServerOnly  = true;
        bypassProxy                  = false;
        acceptInvalidSSLCertificates = false;
      };
    };
  };
}
