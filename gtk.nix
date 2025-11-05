{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    dconf                     
    adwaita-icon-theme           
    papirus-icon-theme            
  ];

  # 🪶 GTK THEME
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
    platformTheme.name = "gtk";   # Makes Qt apps match GTK theme
    style = {
      name = "Catppuccin-Macchiato-Blue"; 
      package = pkgs.catppuccin-kvantum;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Catppuccin-Macchiato-Standard-Blue-Dark";
      icon-theme = "Papirus-Dark";
      color-scheme = "prefer-dark";
      cursor-theme = "Adwaita"; # optional
    };
  };
}
