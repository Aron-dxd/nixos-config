{ ... }:
{
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/etc/NetworkManager/system-connections"
      "/var/lib/bluetooth"
      "/var/lib/systemd/coredump"
      "/var/lib/systemd/backlight"
      "/var/lib/systemd/timers"
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
	".local/state/wireplumber"
        ".local/share/nvim"
        ".local/share/yazi"
        ".local/share/gnupg"
        ".local/share/applications"
        ".local/share/atuin"
	".local/share/zoxide"
	".local/share/Anki2"
	".config/keepassxc"
	".config/calibre"
      ];
      files = [
        ".config/zsh/.zcompdump"
	".local/state/noctalia/instance.id"
	".local/state/noctalia/state.toml"
	".local/state/noctalia/recently_used.json"
	".local/state/noctalia/screen_time.json"
	".local/state/noctalia/usage_counts.json"
	".config/niri/cast-indicator/blocklist"
      ];
    };
  };
}
