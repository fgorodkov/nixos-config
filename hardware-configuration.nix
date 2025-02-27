# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/70c81c46-84bc-4940-8329-76127dcf4f04";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-794a1ed3-5b8c-43cf-ab9c-98defba39b03".device = "/dev/disk/by-uuid/794a1ed3-5b8c-43cf-ab9c-98defba39b03";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/604E-CB45";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
    
  fileSystems."/mnt/Media" =
    { device = "/dev/disk/by-uuid/2ef0d2ba-062b-4c9e-83e6-32574fb65b2b";
      fsType = "ext4";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp9s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
