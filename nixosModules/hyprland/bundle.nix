{ config, lib, ... }:
let
  enableAllHyprland = config.my.enableAllHyprland or false;
in
{
  options.my.enableAllHyprland = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Hyprland";
  };

  imports = [
    ./cachix.nix
    ./hyprland.nix
    ./systools.nix
    ./waybar.nix
  ];

  config = lib.mkIf enableAllHyprland {
    #Enable Hyprland cache
    my.enableCachix = true;
    my.enableHyprland = true;
    my.enableSystools = true;
    my.enableWaybar = true;
  };
}
