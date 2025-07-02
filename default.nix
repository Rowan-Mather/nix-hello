{ nixpkgs }:

{
  mytest.x86_64-linux =
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
      pkgs.runCommand "hi" {} "echo hi > $out";
}
