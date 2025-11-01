{ config, lib, pkgs, ...}:
let fishShell = "${pkgs.fish}/bin/fish";

in
{
	programs.kitty = {
		enable = true;
		extraConfig = ''
			include everforest.conf
			shell ${fishShell}
			'';
		font = {
			package = pkgs.nerd-fonts.departure-mono;
			name = "DepartureMono Nerd Font Mono";
			size = 13;
			};
		};
	home.file.".config/kitty/everforest.conf".source = ./config/kitty/everforest.conf;
}
