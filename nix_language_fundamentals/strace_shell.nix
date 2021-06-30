# Default value for pkgs by importing default nixpkgs
{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
# same like any derivation, it needs a name
name = "strace-shell";
# if buildInputs have a 'bin' directory they get added to PATH
buildInputs = with pkgs; [ strace ];
# gets executed before the shell becomes usable
shellHook = ''
export MSG="Hello World!"
echo $MSG
'';
}
