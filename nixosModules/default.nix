{ config, pkgs, ... }:
{
  imports = [
    ./gaming/steam.nix
    ./social/discord.nix
    ./programacion/git.nix
    ./programacion/nixfmt.nix
    ./programacion/virtualizacion.nix
    ./hyprland/cachix.nix
  ];
}
