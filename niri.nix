{ config, lib, pkgs, ... }:
{
    xdg.configFile."niri/config.kdl".source = ./config/niri/config.kdl;
    home.file.".config/waybar".source = ./config/waybar;
    home.file.".config/rofi".source = ./config/rofi;
    xdg.configFile."niri/config.kdl".force = true;
    programs.waybar.enable = true;
    
    home.packages = [ 
        pkgs.xwayland-satellite 
        pkgs.xwayland-run 
        pkgs.cage
        pkgs.squeekboard 
        pkgs.brightnessctl
        pkgs.swaybg
        pkgs.swaylock
        pkgs.wl-clipboard 
        pkgs.rofi
        pkgs.fuzzel
        pkgs.swaync
    ];
}