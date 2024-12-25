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
    ./hyprland.nix
    ./systools.nix
    ./waybar.nix
  ];

  config = lib.mkIf enableAllHyprland {
    #Enable Hyprland cache
    my.enableHyprland = true;
    my.enableSystools = false;
    my.enableWaybar = false;
  };
}
