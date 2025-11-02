{ config, lib, pkgs, ... }:

{

    imports = [
        /etc/nixos/hardware-configuration.nix
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

    # niri
	programs.fish.enable = true;

    programs.niri.enable = true;
    porgrams.xwayland.enable = true;

    environment = {
        sessionVariables = {
            XDG_SESSION_TYPE = "wayland";
            XDG_SESSION_DESKTOP = "niri";
        };
        systemPackages = with pkgs; [
            xwayland-satellite
        ];
    };
    
    users.users.quin = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        packages = with pkgs; [
            tree
        ];
    };

    programs.firefox.enable = false;
 
	nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
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
        pcmanfm
        nautilus
        
        alacritty
        kitty
        waybar
        niri
        brightnessctl
        wayland-protocols
        libxkbcommon
        xwayland-satellite
        xwayland
        xbindkeys
        xdg-utils
    ];

    nix.settings.experimental-features =  ["nix-command" "flakes" ];
	services.flatpak.enable = true;
	
    system.stateVersion = "25.05";
}
