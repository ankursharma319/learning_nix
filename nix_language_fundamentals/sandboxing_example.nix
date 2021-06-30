# This should fail because of sandboxing

let
  pkgs = import <nixpkgs> {};
in pkgs.runCommand "myhello" { buildInputs = [ ]; }
  ''
    cp ./README.md $out
    # Change this to cp ${./README.md} and it will work
  ''
