{ pkgs, inputs , ... }:
{
  nixpkgs.overlays = [
    inputs.nix-cachyos-kernel.overlays.pinned
  ];

  boot = {	
    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };

    # Extra Kernel Parameters
    kernelParams = [ "nvidia-drm.modeset=1" ];
    kernelModules = ["tcp_bbr"];
    kernel.sysctl = {
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
    };
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-x86_64-v3;

    # Rollback Script for Impermanence
    initrd = {
      systemd.enable = true;
      kernelModules = [ "btrfs" ];
      supportedFilesystems = [ "btrfs" ];
      systemd.services.rollback = {
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
    };
  };
}
