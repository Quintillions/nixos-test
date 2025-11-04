{ config, lib, pkgs, ... }:

let
  noctalia = cmd: [
    "noctalia-shell" "ipc" "call"
  ] ++ (pkgs.lib.splitString " " cmd);
in
{
  xdg.portal = {
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
    ];
  };

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
}
