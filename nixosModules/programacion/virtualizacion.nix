{
  config,
  pkgs,
  lib,
  ...
}:

let
  enableKVM = config.my.enableKVM or false;
in
{
  options.my.enableKVM = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable KVM virtualization and VirtManager in the system";
  };

  config = lib.mkIf enableKVM {
    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      win-virtio
      win-spice
    ];
    users.groups.libvirtd.members = [ "nbr" ];

    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
          ovmf.enable = true;
          ovmf.packages = [ pkgs.OVMFFull.fd ];
        };
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;
    programs.dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}