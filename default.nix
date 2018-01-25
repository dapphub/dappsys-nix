{ callSolidityPackage }:
let
  pkg = x: callSolidityPackage x { inherit dappsys; };
  dappsys = {
    ds-auth     = pkg ./ds-auth;
    ds-cache    = pkg ./ds-cache;
    ds-chief    = pkg ./ds-chief;
    ds-exec     = pkg ./ds-exec;
    ds-guard    = pkg ./ds-guard;
    ds-math     = pkg ./ds-math;
    ds-multisig = pkg ./ds-multisig;
    ds-note     = pkg ./ds-note;
    ds-proxy    = pkg ./ds-proxy;
    ds-roles    = pkg ./ds-roles;
    ds-spell    = pkg ./ds-spell;
    ds-stop     = pkg ./ds-stop;
    ds-test     = pkg ./ds-test;
    ds-thing    = pkg ./ds-thing;
    ds-token    = pkg ./ds-token;
    ds-value    = pkg ./ds-value;
    ds-vault    = pkg ./ds-vault;
    erc20       = pkg ./erc20;
  };
in dappsys
