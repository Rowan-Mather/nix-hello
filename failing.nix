{ nixpkgs }:

{
  failing =
    let pkgs = import nixpkgs {};
    in 
      pkgs.stdenv.mkDerivation {
        name = "fail-quickly";
        version = "1.0";
      
        unpackPhase = ":";
        src = null;
      
        buildPhase = ''
          mkdir -p $out/bin
          exit 1
        '';
      };
}
