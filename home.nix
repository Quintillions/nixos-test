{config, pkgs, ...}:

{
    imports = [ 
        ./chatnwhatnot.nix # This imports the chat and whatnot packages
        ./niri.nix # This imports the chat and whatnot packages
	./kitty.nix
    ];

    home.username = "quin";
    home.homeDirectory = "/home/quin";
    home.stateVersion = "25.05";
    programs.bash = {
        enable = true;
        shellAliases = {
            wtf = "I HATE NIXXERS";
        };
    };
    home.packages = [
        pkgs.pulseaudio
        pkgs.playerctl

    ];
}

