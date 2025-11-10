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
	hardware.opengl = {
  		enable = true;
  		extraPackages = with pkgs; [
    		libva        # Core VA-API library
    		intel-media-driver  # Intel GPU VA-API driver
        mesa
        vulkan-loader
        vulkan-tools
        vulkan-validation-layers
        intel-compute-runtime
        mesa-vulkan-drivers
  		];
	};

  xdg.portal = {
    enable = true;
    wlr.enable = false; # Use GTK/GNOME portals instead
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
    sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "niri";
      XDG_SESSION_DESKTOP = "niri";
    };

    systemPackages = with pkgs; [
      # ─────────────────────────────
      # 🧰 Utilities
      # ─────────────────────────────
      vim
      wget
      git
      light
      brightnessctl
      iproute2
      parted
      gcc
      plymouth
      power-profiles-daemon
      hwdata
      seatd

      # ─────────────────────────────
      # 🖥️ Graphics & Display Stack
      # ─────────────────────────────
      niri
      cage
      swaybg
      swaylock
      wl-clipboard
      arandr
      xbindkeys
      xdg-utils
      xwayland
      xwayland-run
      xwayland-satellite
      kdePackages.polkit-kde-agent-1
      ffmpeg
      mpv

      # ─────────────────────────────
      # 🧩 Wayland / X / Rendering Libraries
      # ─────────────────────────────
      wayland
      wayland-protocols
      libdrm
      libinput
      libxkbcommon
      libdisplay-info
      libliftoff
      pixman
      glibc
      meson
      ninja
      pcre2

      # ─────────────────────────────
      # 📸 Screen Recording & Portal Integration
      # ─────────────────────────────
      gpu-screen-recorder
      gpu-screen-recorder-gtk
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome

      # ─────────────────────────────
      # 🎨 Theming & Configuration
      # ─────────────────────────────
      matugen
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








