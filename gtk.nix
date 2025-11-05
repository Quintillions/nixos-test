{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    dconf
  ];

  # 🪶 GTK theme
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Standard-Blue-Dark"; 
      package = pkgs.catppuccin-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark"; 
      package = pkgs.papirus-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk"; 
    style = {
      name = "Catppuccin-Macchiato-Blue"; 
      package = pkgs.catppuccin-kvantum;
    };
  };
}
