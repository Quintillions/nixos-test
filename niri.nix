{ config, lib, pkgs, ... }:
{
    # home.file.".config/niri".source = ./config/niri;
    home.file.".config/waybar".source = ./config/waybar;
    home.file.".config/rofi".source = ./config/rofi;

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
    ];
}