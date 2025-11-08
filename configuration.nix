{ config, lib, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./fonts.nix # Import nix fonts
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  services.getty.autologinUser = "quin";

  # Timezone
  time.timeZone = "Asia/Manila";

  # XWayland support
  programs.xwayland.enable = true;

  # FOR screen recording and portals
  xdg.portal = {
    enable = true;
    wlr.enable = true; # Use GTK/GNOME portals instead
    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];

    configPackages = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };

  services = {
    # Display manager
	dbus.enable = true;
    xserver.displayManager.lightdm.enable = false;
    displayManager.ly = {
		enable = true;
	};

    # Power management
    upower.enable = lib.mkDefault true;
    power-profiles-daemon.enable = lib.mkDefault true;

    # Flatpak support
    flatpak.enable = true;

    # X server
    xserver.enable = true;

    # Pipewire for audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
  };

  # Niri (Wayland desktop)
  xdg.mime.enable = true;
  security.polkit.enable = true;

  environment = {
	etc = {
      "xdg/wayland-sessions/niri.desktop".text = ''
        [Desktop Entry]
        Name=Niri
        Comment=Niri Wayland Session
        Exec=niri
        Type=Application
        DesktopNames=Niri
      '';
    };
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
      niri
      gpu-screen-recorder
      gpu-screen-recorder-gtk
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
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
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
      packages = with pkgs; [ tree ];
    };
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.05";
}

