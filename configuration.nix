{ config, lib, pkgs, ... }:

{

    imports = [
        /etc/nixos/hardware-configuration.nix
		./fonts.nix #import nix fonts
    ];

    # bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    #host name
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;
    services.getty.autologinUser = "quin";  
    # time zone
    time.timeZone = "Asia/Manila";
    programs.xwayland.enable = true;

    # FOR screen recording

    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;

        extraPortals = with pkgs; [
            xdg-desktop-portal-wlr
            xdg-desktop-portal-gtk
        ];
        configPackages = [ pkgs.xdg-desktop-portal-wlr ];
    };
    services.xserver.enable = true;



    # niri
    services.xserver.displayManager.lightdm.enable = false;
	xdg.mime.enable = true;

    
    environment = {
        sessionVariables = {
            XDG_SESSION_TYPE = "wayland";
            XDG_CURRENT_DESKTOP = "niri";
            XDG_SESSION_DESKTOP = "niri";
        };

        systemPackages = with pkgs; [

            # Utilities
            vim
            wget
            git
            light
            iproute2
            gcc
            plymouth
            parted
            power-profiles-daemon


            # For Niri & Wayland
            waybar
            niri
            brightnessctl
            libxkbcommon
            cage
            swaybg
            swaylock
            wl-clipboard
            rofi
            fuzzel
            xdg-desktop-portal
            xdg-desktop-portal-gnome
            xdg-desktop-portal-gtk
            xwayland-satellite
            xwayland
            xbindkeys
            xdg-utils
            xwayland-run
            wayland-protocols
        ];
    };
    
    users = {
        users.quin = {
            isNormalUser = true;
            extraGroups = [ "wheel" ];
            packages = with pkgs; [
                tree
            ];
        };
    };

    programs.firefox.enable = true;
 
	nixpkgs.config.allowUnfree = true;


    nix.settings.experimental-features =  ["nix-command" "flakes" ];
	services.flatpak.enable = true;
	
    system.stateVersion = "25.05";
}


