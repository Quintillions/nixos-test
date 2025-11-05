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
  xdg.dataFile."icons/Papirus-Dark".source = "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark";
  xdg.dataFile."icons/hicolor".source = "${pkgs.adwaita-icon-theme}/share/icons/hicolor";

  xdg.desktopEntries.nautilus = {
    name = "Files";
    exec = "nautilus";
    icon = "org.gnome.Nautilus";
    categories = [ "GNOME" "System" "FileManager" ];
    terminal = false;
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
      icon-theme = "Papirus-Dark";
      gtk-theme = "Catppuccin-Macchiato-Standard-Blue-Dark";
      color-scheme = "prefer-dark";
    };
  };
}
