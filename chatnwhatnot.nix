{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    libreoffice
    spicetify-cli
    
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
