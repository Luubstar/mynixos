{config, pkgs, ...} :
{
imports = [
    ./gaming/steam.nix
    ./social/discord.nix
    ./programacion/git.nix
    ./programacion/nixfmt.nix
    ];
}
