{
  config,
  pkgs,
  lib,
  ...
}:
let
  enableWaybar = config.my.enableWaybar or false;
in
{
  options.my.enableWaybar = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable waybar in the system";
  };

  config = lib.mkIf enableWaybar {
    environment.systemPackages = with pkgs; [
      (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      }))
    ];

  };
}
