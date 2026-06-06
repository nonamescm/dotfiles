# Wrapper file to define the current active color mode
let
  bloop = import ./bloop-definition.nix;
  mode = import ./mode.nix;
in
bloop.${mode}
