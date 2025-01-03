{ config, pkgs, ... }:
{
  imports = [
    ./gaming/steam.nix
    ./gaming/heroic.nix
    ./social/discord.nix
    ./programacion/git.nix
    ./programacion/nixfmt.nix
    ./programacion/virtualizacion.nix
    ./programacion/rust.nix
    ./programacion/rustrover.nix
    ./hyprland/cachix.nix
    ./hyprland/hyprlandModule.nix
  ];
}
