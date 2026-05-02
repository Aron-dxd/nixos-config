{ config, pkgs, lib, ... }:
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
			"/var/cache/sysc-greet"
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
		users.aron = {
			directories = [
				"Downloads"
				"Documents"
				"Pictures"
				"Videos"
				".ssh"
				".local/share/keyrings"
				".local/share/nvim"
				".local/share/yazi"
				".local/share/gnupg"
				".local/share/applications"
				".config/nvim"
				".config/noctalia"
				".config/yazi"
				".config/kitty"
				".config/zsh"
				".config/gtk-3.0"
				".config/gtk-4.0"
				".config/sysc-greet"
				".config/KeePassXC"
				".cache/noctalia"
				".zen"

			];
			files = [
			];
		};
	};
}
