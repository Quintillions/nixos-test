{ config, lib, pkgs, ... }:
{
  home.packages = [
    pkgs.spotify
    pkgs.vesktop
    pkgs.steam
    
  ];
}