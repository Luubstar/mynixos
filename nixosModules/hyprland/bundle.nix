{ config, pkgs, ... }:
let
  enableAllHyprland = config.my.enableAllUHyprland or false;
in
{
  imports = [
    ./cachix.nix
    ./hyprland.nix
    ./systools.nix
    ./wayland.nix
  ];

  options.my.enableAllHyprland = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Hyprland";
  };

  config = lib.mkIf enableAllHyprland {
    #Enable Hyprland cache
    my.enableCachix = true;
    my.enableHyprland = true;
    my.enableSystools = true;
    my.enableWaybar = true;
  };
}
