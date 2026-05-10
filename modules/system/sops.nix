{ config, ... }:
{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = [ "/persist/home/aron/.ssh/sops-nix" ];

    secrets = {
      "rclone-client-secret" = {};
      "rclone-token" = {};
      "aron-password" = {
        neededForUsers = true;
      };
      "root-password" = {
        neededForUsers = true;
      };
    };
  };
}
