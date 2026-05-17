{ config, ... }:
{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = [ "/persist/home/aron/.ssh/sops-nix" ];

    secrets = {
      "rclone-client-secret" = {
        owner = "aron";
	mode = "0400";
      };
      "rclone-token" = {
        owner = "aron";
	mode = "0400";
      };
      "aron-password" = {
        neededForUsers = true;
      };
      "root-password" = {
        neededForUsers = true;
      };
    };
  };
}
