{ config, pkgs, lib, inputs, ... }:
{
	imports = [
		./hardware-configuration.nix
		./impermanence.nix
	];

	# BOOTLOADER
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.efi.efiSysMountPoint = "/boot";

	boot.kernelParams = [ "nvidia-drm.modeset=1" ];
	boot.kernelPackages = pkgs.linuxPackages_latest;	

	boot.initrd.systemd.enable = true;
	boot.initrd.kernelModules = [ "btrfs" ];
	boot.initrd.supportedFilesystems = [ "btrfs" ];
	boot.initrd.systemd.services.rollback = {
		description = "Rollback BTRFS root subvolume to empty state";
		wantedBy = [ "initrd.target" ];
		requires = [ "dev-nvme0n1p3.device" ];
		after = [ "dev-nvme0n1p3.device" ];
		before = [ "sysroot.mount" ];
		unitConfig.DefaultDependencies = "no";
		serviceConfig.Type = "oneshot";
		script = ''
			mkdir -p /mnt-rollback
			mount -t btrfs -o subvol=/ /dev/nvme0n1p3 /mnt-rollback
			if [ -e /mnt-rollback/@ ]; then
				btrfs subvolume list -o /mnt-rollback/@ | cut -f9 -d' ' | while read subvolume; do
					echo "Deleting /$subvolume subvolume..."
					btrfs subvolume delete "/mnt-rollback/$subvolume"
				done
				echo "Deleting /@ subvolume..."
				btrfs subvolume delete /mnt-rollback/@
			fi
			echo "Restoring blank /@ subvolume..."
			btrfs subvolume snapshot /mnt-rollback/@-blank /mnt-rollback/@
			if [ -e /mnt-rollback/@home ]; then
				echo "Deleting /@home subvolume..."
				btrfs subvolume delete /mnt-rollback/@home
			fi
			echo "Restoring blank /@home subvolume..."
			btrfs subvolume snapshot /mnt-rollback/@home-blank /mnt-rollback/@home
			umount /mnt-rollback
		'';
	};

	# USERS
	users.mutableUsers = lib.mkForce false;
	users.users.aron = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" "docker" ];
		shell = pkgs.zsh;
		hashedPasswordFile = "/persist/passwords/aron";
	};
	users.users.root.hashedPasswordFile = "/persist/passwords/root";

	# NETWORKING
	networking.hostName = "hiroshima";
	networking.networkmanager.enable = true;

	# LOCALIZATION
	time.timeZone = "Asia/Kolkata";
	i18n.defaultLocale = "en_US.UTF-8";

	# HARDWARE
	hardware.graphics.enable = true;
	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = true;
		powerManagement.finegrained = true;
		open = false;
		nvidiaSettings = true;
		prime = {
			offload = {
				enable = true;
				enableOffloadCmd = true;
			};
			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:1:0:0";
		};
	};
	hardware.bluetooth.enable = true;
	services.upower.enable = true;
	services.power-profiles-daemon.enable = true;
	services.xserver.videoDrivers = [ "nvidia" ];

	# SYSTEM SERVICES
	services.cloudflare-warp.enable = true;

	zramSwap.enable = true;
	zramSwap.algorithm = "zstd";

	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};
	
	services.sysc-greet = {
		enable = true;
		compositor = "hyprland";
	};

	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-hyprland  pkgs.xdg-desktop-portal-gtk ];
		config.common.default = [ "hyprland" "gtk" ];
	};

	# SYSTEM PACKAGES
	environment.systemPackages = with pkgs; [
		git
		vim
		wget
		curl
		btop
		pciutils
		usbutils
		inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
		keepassxc
		cloudflare-warp
	];

	programs.zsh.enable = true;
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	environment.sessionVariables = {
		NIXOS_OZONE_WL = "1";
		WLR_NO_HARDWARE_CURSORS = "1";
		__GLX_VENDOR_LIBRARY_NAME = "nvidia";
		LIBVA_DRIVER_NAME = "nvidia";
		GBM_BACKEND = "nvidia-drm";
		
		XDG_CONFIG_HOME = "$HOME/.config";
		XDG_DATA_HOME = "$HOME/.local/share";
		XDG_CACHE_HOME = "$HOME/.cache";
		XDG_STATE_HOME = "$HOME/.local/state";
	};

	security.sudo.extraConfig = ''
		Defaults lecture = never
	'';

	# NIX SETTINGS
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 3d";
	};
	nix.settings = {
		experimental-features = [ "nix-command" "flakes" ];
		auto-optimise-store = true;
	};

	nixpkgs.config.allowUnfree = true;

	system.stateVersion = "25.11";
}
