{ config, pkgs, lib, ... }:
{
	programs.fuse.userAllowOther = true;

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
				".local/state/wireplumber"
				".local/share/yazi"
				".cache/noctalia"
				".config/noctalia"
				".zen"
			];
			files = [
				".config/zsh/.zsh_history"
			];
		};
	};
}
