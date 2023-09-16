
# necessary for python module control
bsklenv <- basilisk::BasiliskEnvironment(
  envname = "bsklenv", packages = "pandas==1.3.5",
  pkgname = "litbas", pip = c("tensorflow==2.8.0",
    "numpy==1.21.5", "protobuf==3.20.0", "scanpy==1.9.5"),
  paths="sfaira")


