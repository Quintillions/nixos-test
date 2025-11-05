{ lib, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.emable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "xiong-chiamiov-plus";
      plugins = [
        "git"
        "sudo"
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
        opacity = 1;
      };


      terminal = {
        shell = {
          program = "${pkgs.zsh}/bin/zsh";
          args = [ "-l" ]; # "-l" = login shell (optional, but good practice)
        };
      };

  
    };
    theme = "catppuccin_macchiato";

  };
}
