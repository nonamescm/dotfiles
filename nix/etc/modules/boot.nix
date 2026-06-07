{ pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    extraEntries = ''
      menuentry "GParted ISO" {
        set root=(hd0,gpt3)
        set isofile="/gparted-live-1.8.1-3-amd64.iso"
        loopback loop $isofile
        linux (loop)/live/vmlinuz boot=live union=overlay username=user components noswap ip=net.ifnames=0 toram=filesystem.squashfs findiso=$isofile
        initrd (loop)/live/initrd.img
      }
    '';
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
