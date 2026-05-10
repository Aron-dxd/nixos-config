{ ... }:
{
  programs.rclone = {
    enable = true;
    remotes = {
      gdrive = {
        config = {
          type = "drive";
          scope = "drive";
          team_drive = "";
          client_id = "305619684894-9ied4vc0k82och3ek45gdt2jkao07f89.apps.googleusercontent.com";
          };

          secrets = {
            client_secret = "/run/secrets/rclone-client-secret";
            token = "/run/secrets/rclone-token";
          };

        mounts = {
          "KeePassXC" = {
            enable = true;
            autoMount = true;
            mountPoint = "%h/Documents/KeePassXC";
            options = {
              vfs-cache-mode = "full";
              vfs-cache-max-size = "500M";
              vfs-cache-max-age = "24h";
              dir-cache-time = "1m";
              no-modtime = true;
            };
          };
        };
      };
    };
  };
}
