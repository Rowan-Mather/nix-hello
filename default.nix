{ nixpkgs }:

let
  pkgs = import nixpkgs {};
in
{
  mytest = pkgs.runCommand "hi" {} "echo hi > $out";
}
