{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    vesktop
    libreoffice
    # pkgs.steam
    
  ];

}
