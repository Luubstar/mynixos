{
  config,
  pkgs,
  inputs,
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
  config = lib.mkIf enableHyprland {
    home.sessionVariables.NIXOS_OZONE_WL = "1";
    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
        exec-one = ''${startupScript}/bin/start'';
      };
    };
  };
}
