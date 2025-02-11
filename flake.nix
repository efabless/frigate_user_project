{
  inputs = {
    openlane = {
      url = github:efabless/openlane2/main;
    };
  };

  outputs = {
    self,
    openlane,
    ...
  }: let
    nix-eda = openlane.inputs.nix-eda;
    devshell = openlane.inputs.devshell;
    nixpkgs = nix-eda.inputs.nixpkgs;
    lib = nixpkgs.lib;
  in {
    # Outputs
    legacyPackages = nix-eda.forAllSystems (
      system:
        import nixpkgs {
          inherit system;
          overlays = [
            nix-eda.overlays.default
            devshell.overlays.default
            openlane.overlays.default
            (nix-eda.composePythonOverlay (pkgs': pkgs: pypkgs': pypkgs: let
              callPythonPackage = lib.callPackageWith (pkgs' // pkgs'.python3.pkgs);
            in {
              openlane-plugin-frigate = callPythonPackage ./openlane_plugin_frigate/default.nix {};
            }))
          ];
        }
    );

    devShells = nix-eda.forAllSystems (system: let
      pkgs = self.legacyPackages.${system};
    in {
      default = lib.callPackageWith pkgs (openlane.createOpenLaneShell {
        openlane-plugins = [
          pkgs.python3.pkgs.openlane-plugin-frigate
        ];
        extra-packages = [
          pkgs.verilog
          pkgs.gtkwave
        ];
      }) {};
    });
  };
}
