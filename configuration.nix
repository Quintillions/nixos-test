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

    # time zone
    time.timeZone = "Asia/Manila";

    services.getty.autologinUser = "quin";


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
    services.displayManager.defaultSession = "niri";
	programs.fish.enable = true;
    programs.xwayland.enable = true;
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
            kdePackages.kate
            git
            light
            curl
            zip
            unzip
            bluez
            p7zip
            unrar
            rar
            gnutar
            iproute2
            gcc
            plymouth
            parted
            nnn


            # For Niri & Wayland
            alacritty
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
            xdg-desktop-portal-gtk
            xdg-desktop-portal-wlr
            xwayland-satellite
            xwayland
            xbindkeys
            xdg-utils
            xwayland-run
            wayland-protocols
        ];
    };
    
    users.users.quin = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        packages = with pkgs; [
            tree
        ];
    };

    programs.firefox.enable = true;
 
	nixpkgs.config.allowUnfree = true;


    nix.settings.experimental-features =  ["nix-command" "flakes" ];
	services.flatpak.enable = true;
	
    system.stateVersion = "25.05";
}


