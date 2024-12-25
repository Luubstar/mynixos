{
  config,
  pkgs,
  lib,
  ...
}:
let
  enableSystools = config.my.enableWaybar or false;
in
{
  options.my.enableSystools = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable systools in the system";
  };

  config = lib.mkIf enableSystools {
    home.packages = with pkgs; [
      mako
      libnotify
      kitty
      #swww
      rofi-wayland
      clipman
      cliphist
      hyprlock
      yazi
    ];
  };
}
