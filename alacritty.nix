{ lib, pkgs, ... }:
{
  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      theme = "xiong-chiamiov-plus";
      plugins = [
        "git"
      ];
    }; 
  };
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "none";
        dynamic_title = true;
        opacity = 1;
      };


      terminal = {
        shell = {
          args = [ "-l" ]; # "-l" = login shell (optional, but good practice)
        };
      };

  
    };
    theme = "catppuccin_macchiato";

  };
}
