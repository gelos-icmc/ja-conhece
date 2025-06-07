{
  outputs = { self, nixpkgs }: let
    forAllSystems = f: nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (s: f nixpkgs.legacyPackages.${s});
  in rec {
    msg = "Já conhece o GELOS?";
    packages = forAllSystems (pkgs: {
      default = pkgs.writeShellScriptBin "ja-conhece" ''
        echo "${msg}"
      '';
    });
  };
}
