{
  config,
  pkgs,
  inputs,
  ...
}:
let
  enableHyprland = config.my.enableHyprland or false;
in
{
  options.my.enableHyprland = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Hyprland in the system by Home Manager";
  };

  programs.kitty.enable = true;
  wayland.windowManager.hyprland.enable = true;

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
