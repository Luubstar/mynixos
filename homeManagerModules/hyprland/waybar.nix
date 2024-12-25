{
  config,
  pkgs,
  lib,
  ...
}:
let
  # Define el paquete modificado
  customWaybar = pkgs.waybar.overrideAttrs (oldAttrs: {
    mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
  });
in
{
  # Activa la gestión de paquetes con Home Manager
  home.packages = with pkgs; [
    customWaybar
  ];
}
