{ config, lib, pkgs, ... }:

{

    imports = [
        ./hardware-configuration.nix
    ];

    # bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    #host name
    networking.hostName = "nixxer;
    networking.networkmanager.enable = true;

    # time zone
    time.timeZone = "Asia/Manila";

    services.getty.autologinUser = "quin";
    
    programs.niri = {
        enable = true;
    }

    users.users.quin = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        packages = with pkgs; [
        tree
        ];
    };

    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
        vim
        wget
        kitty
        kdePackages.Kate
        waybar
        git
        swaybg
    ];
    nix.settings.experimental-features =  ["nix-command" "flakes" ];

    system.stateVersion = "25.05";
}