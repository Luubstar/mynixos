{
  config,
  pkgs,
  inputs,
  lib,
  services,
  ...
}:
let
  enableHyprland = config.my.enableHyprland or false;

  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init &

    sleep 1

    ${pkgs.swww}/bin/swww img ${./wallpaper.png} &

  '';
in
{
  options.my.enableHyprland = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Hyprland in the system by Home Manager";
  };

  config = lib.mkIf enableHyprland {
    xdg.portal.enable = true;
    xdg.portal.config = {
      common = {
        default = [
         "gtk"
        ];
      };
    }

    home.sessionVariables.NIXOS_OZONE_WL = "1";
    wayland.windowManager.hyprland = {
      enable = true;
    };
  };
}
