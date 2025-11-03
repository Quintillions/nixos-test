{ config, lib, pkgs, ... }:

let
  noctalia = cmd: [
    "noctalia-shell" "ipc" "call"
  ] ++ (pkgs.lib.splitString " " cmd);
in
{
  #xdg.configFile."niri/config.kdl".source = ./config/niri/config.kdl;
  #home.file.".config/waybar".source = ./config/waybar;
  home.file.".config/rofi".source = ./config/rofi;
  #xdg.configFile."niri/config.kdl".force = true;
  #programs.waybar.enable = true;

  programs.niri = {
    enable = true;
    settings = {
      spawn-at-startup = [
        {
          command = [ "noctalia-shell" ];
        }
      ];
      binds = with config.lib.niri.actions; {
        "Mod+L".action.spawn = noctalia "lockScreen toggle";
        "Mod+D".action.spawn = noctalia "launcher toggle";
        "XF86AudioLowerVolume".action.spawn = noctalia "volume decrease";
        "XF86AudioRaiseVolume".action.spawn = noctalia "volume increase";
        "XF86AudioMute".action.spawn = noctalia "volume muteOutput";
      };
    };
  };

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
}
