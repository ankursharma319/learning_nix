let
    pkgs = import <nixpkgs> {};
in
    pkgs.runCommand "colourful_ls" {} ''
    mkdir -p $out/bin
    ln -s ${pkgs.coreutils}/bin/ls $out/bin/ls
    echo "Done symlinking"
    ''

# Install example
# nix-env --install --file ./colourful_ls.nix

# Uninstall example
# nix-env --uninstall colourful_ls