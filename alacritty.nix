{ lib, pkgs, ... }:
{
   home.packages = with pkgs; [
    fastfetch
    
  ];
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = lib.mkOrder 1500 "
      fastfetch
    ";
    oh-my-zsh = {
      enable = true;
      theme = "xiong-chiamiov-plus";
      plugins = [
        "git"
        "sudo"
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
