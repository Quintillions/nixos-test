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
		wlr.enable = true;
        xdgOpenUsePortal = true;

        extraPortals = with pkgs; [
            xdg-desktop-portal-wlr
            xdg-desktop-portal-gtk
        ];
        configPackages = [ pkgs.xdg-desktop-portal-wlr ];
    };


	services = {
		xserver.displayManager.lightdm.enable = false;
		displayManager.ly.enable = true;
		upower.enable = lib.mkDefault true; 
		power-profiles-daemon.enable = lib.mkDefault true;
		flatpak.enable = true;
		xserver.enable = true;
		pipewire = {
			enable = true;
			alsa.enable = true;
			pulse.enable = true;
		};
		
	};
    # niri
	xdg.mime.enable = true;
	security.polkit.enable = true;
	programs.gpu-screen-recorder.enable = true;
    
    environment = {
		etc."wayland-sessions/niri.desktop".text = ''
			[Desktop Entry]
			Name=Niri
			Comment=Wayland Session for Niri
			Exec=dbus-run-session niri
			Type=Application
			'';
			
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
			gpu-screen-recorder-gtk
            niri
            brightnessctl
            libxkbcommon
            glibc
            libinput
            libdrm
            pixman
            meson
            ninja
            libdisplay-info
            libliftoff
            hwdata
            seatd
            pcre2
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
            wayland

        ];
    };
    
    users = {
        users.quin = {
            isNormalUser = true;
            extraGroups = [ "wheel" "audio" "networkmanager" "input" "video" "power" ];
            packages = with pkgs; [
                tree
            ];
        };
    };

    programs.firefox.enable = true;
 
	nixpkgs.config.allowUnfree = true;


    nix.settings.experimental-features =  ["nix-command" "flakes" ];
	
    system.stateVersion = "25.05";
}








