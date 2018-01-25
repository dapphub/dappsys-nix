{ solidityPackage, dappsys }: solidityPackage {
  name = "ds-spell";
  deps = with dappsys; [ds-exec ds-note ds-test];
  src = ./src;
}
