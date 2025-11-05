{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    vesktop
    libreoffice
    
    # dev
    python3
    lua
    lazygit
    docker


    # system info
    btop
    fastfetch
    nitch
    gdu
    gparted

  ];

}
