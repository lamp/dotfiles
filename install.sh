# print all the things
set -x
mkdir -p ~/.config/nixpkgs
ln -sFv "$(pwd)/.config/nixpkgs/home.nix" ~/.config/nixpkgs/home.nix
sh <(curl -L https://nixos.org/nix/install)
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
# this is not set by default
export NIX_PATH=${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels
nix-shell '<home-manager>' -A install
home-manager switch
