{ config, pkgs, inputs, ... }:

{
  imports = [ ./modules/neovim ];

  home.username = "imsozrious";
  home.homeDirectory = "/home/imsozrious";

  home.packages = with pkgs;
  let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
  in
  [
    discord
    zip
    unzip
    neofetch

    unstable.cargo
    unstable.rustc
    unstable.rust-analyzer

    vscode

    openocd
    ripgrep
    kitty

    eza
    yq
    zoxide

    mtr

    lazygit
  ];

  programs.git = {
    enable = true;
    userName = "imsozrious";
    userEmail = "30285202+ImSoZRious@users.noreply.github.com";
    ignores = [
      ".direnv"
      ".envrc"
    ];
  };

  programs.home-manager.enable = true;
  programs.direnv.enable = true;

  home.stateVersion = "23.11";
}
