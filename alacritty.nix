{ lib, pkgs, ... }:
{
  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      theme = "xiong-chiamiov-plus";
      plugins = [
        "git"
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
      ];
    }; 
  };
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "none";
        dynamic_title = true;
        opacity = 0.6;
        blur = true;
      };


      terminal = {
        shell = {
          program = "${pkgs.zsh}/bin/zsh";
          args = [ "-l" ]; # "-l" = login shell (optional, but good practice)
        };
      };

      
      theme = "catppuccin-macchiato";
    };

  };
}
