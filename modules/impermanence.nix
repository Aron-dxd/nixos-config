{ ... }:
{
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/etc/NetworkManager/system-connections"
      "/var/lib/bluetooth"
      "/var/lib/systemd/coredump"
      "/var/lib/nixos"
      "/var/lib/docker"
      "/var/lib/NetworkManager"
      "/var/cache/tuigreet"
      "/root"
    ];
    files = [
      "/etc/machine-id"
      "/etc/adjtime"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];

    # User Specific Persistence
    users.aron = {
      directories = [
        "Downloads"
        "Documents"
        "Pictures"
        "Videos"
	"Music"
	"Calibre_Library"
        ".ssh"
        ".zen"
        ".local/share/nvim"
        ".local/share/yazi"
        ".local/share/gnupg"
        ".local/share/applications"
        ".local/share/atuin"
	".local/share/zoxide"
	".local/share/Anki2"
	".config/keepassxc"
	".config/calibre"
        # Noctalia keeps some data here for some reason
        ".cache/noctalia"
      ];
      files = [
      ];
    };
  };
}
