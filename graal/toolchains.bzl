"Default toolchain registration"

def graal_register_toolchains(name = "unnamed"):
    native.register_toolchains(
        "@rules_graal//graal:graal_darwin_toolchain",
        "@rules_graal//graal:graal_linux_toolchain",
    )