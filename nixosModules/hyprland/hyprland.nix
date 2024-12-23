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
in
{
  options.my.enableHyprland = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Hyprland in the system by Home Manager";
  };

  config = lib.mkIf enableHyprland {
    programs.hyprland.enable = true;
    programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
