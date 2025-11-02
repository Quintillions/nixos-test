{ config, lib, pkgs, ... }:

{

    imports = [
        ./hardware-configuration.nix
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

#	services.displayManager.defaultSession = "niri";
#	environment.sessionVariables = {
#		XDG_SESSION_TYPE = "wayland";
#		XDG_CURRENT_DESKTOP = "KDE";
#		XDG_SESSION_DESKTOP = "niri";
#		WAYLAND_DISPLAY = "wayland-0";
#	};

	programs.fish.enable = true;    
    programs.niri.enable = true;
    
    xdg.portal = {
        enable = true;
        extraPortals = [pkgs.xdg-desktop-portal-gtk];
        config = {
            common = {
                default = ["gtk"];
            };
        };
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

    environment.systemPackages = with pkgs; [
        vim
        wget
        kitty
        kdePackages.kate
        waybar
        git
       	light
        curl
        niri
        zip
        brightnessctl
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
        xwayland-satellite
        xbindkeys
        xdg-utils
        xbindkeys-config
        nnn
        pcmanfm
        nautilus
        wayland-protocols
        libxkbcommon
    ];
    nix.settings.experimental-features =  ["nix-command" "flakes" ];
	services.flatpak.enable = true;
	
    system.stateVersion = "25.05";
}
