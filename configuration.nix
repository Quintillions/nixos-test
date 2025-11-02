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

	programs.fish.enable = true;    
    programs.niri.enable = true;

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
