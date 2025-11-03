{ config, pkgs, ... }:

{
fonts.packages = with pkgs; [
    fira-code
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    d2coding
    font-awesome
  ];
}
