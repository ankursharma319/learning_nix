{ input? "default" }:
let
    aString = "something-${input}";
    aList = import ./meta_simple.nix {inherit input;};
in {
    inherit aString;
    inherit aList;
}
