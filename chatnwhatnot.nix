{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    vesktop
    # pkgs.steam
    
  ];

}
