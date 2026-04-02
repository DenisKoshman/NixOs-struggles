{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 5;
    };

    kernelPackages = pkgs.linuxPackages_6_12;
    kernelModules = [ "hid-nintendo" ];
    supportedFilesystems = [ "ntfs" ];

    blacklistedKernelModules = [ "nouveau" ]; # for nvidia-fix.nix
    kernelParams = [
      "nvidia.NVreg_DynamicPowerManagement=0x02"
      "i915.enable_guc=2" # for nvidia-fix.nix
      "i915.enable_fbc=1" # for nvidia-fix.nix
      "nvidia-drm.modeset=1" # for nvidia-fix.nix
      "usbcore.autosuspend=-1" # dota mouse Rappo fix
      #"usbhid.quirks=0x24ae:0x1813:0x0004" # dota mouse Rappo fix
    ];
  };
}
