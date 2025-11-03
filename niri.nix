{ pkgs, inputs, ... }:

let
  # Helper function for noctalia-shell IPC calls
  noctalia = cmd: [
    "noctalia-shell" "ipc" "call"
  ] ++ (pkgs.lib.splitString " " cmd);
in
{
#  home.file.".config/rofi".source = ./config/rofi;

  home-manager.users.quin = { config, lib, pkgs, ... }: {
    home.packages = [
      pkgs.xwayland-satellite
      pkgs.xwayland-run
      pkgs.cage
      pkgs.squeekboard
      pkgs.brightnessctl
      pkgs.swaybg
      pkgs.swaylock
      pkgs.wl-clipboard
      pkgs.rofi
      pkgs.fuzzel
    ];

    programs = {
      niri = {
        enable = true;
        settings = {
          binds = {
            # --- Noctalia integration keybinds ---
            "Mod+Space" = { action.spawn = noctalia "launcher toggle"; };
            "Mod+P"     = { action.spawn = noctalia "sessionMenu toggle"; };
            "Mod+L"     = { action.spawn = noctalia "lockScreen toggle"; };
            "XF86AudioLowerVolume" = { action.spawn = noctalia "volume decrease"; };
            "XF86AudioRaiseVolume" = { action.spawn = noctalia "volume increase"; };
            "XF86AudioMute"        = { action.spawn = noctalia "volume muteOutput"; };
          };
        };
      };
    };
  };
}
