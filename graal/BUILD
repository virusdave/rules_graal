load("@rules_graal//graal:graal_toolchain.bzl", "graal_toolchain")

toolchain_type(name = "toolchain_type")

graal_toolchain(
    name = "graal_linux",
    native_image_path = "@graal//:bin/linux-amd64/native-image",
)

graal_toolchain(
    name = "graal_darwin",
    native_image_path = "@graal//:bin/darwin-amd64/native-image",
)

# TODO(Dave): This probably shouldn't be the same toolchain rule, right?  :thinking_face:
graal_toolchain(
    name = "graal_darwin_to_linux_via_docker",
    native_image_path = "@graal//:bin/linux-amd64/native-image",
)

toolchain(
    name = "graal_linux_toolchain",
    exec_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    toolchain = ":graal_linux",
    toolchain_type = ":toolchain_type",
)

toolchain(
    name = "graal_darwin_toolchain",
    exec_compatible_with = [
        "@platforms//os:macos",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "@platforms//os:macos",
        "@platforms//cpu:x86_64",
    ],
    toolchain = ":graal_darwin",
    toolchain_type = ":toolchain_type",
)

toolchain(
    name = "graal_darwin_to_linux_via_docker_toolchain",
    exec_compatible_with = [
        "@platforms//os:macos",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    toolchain = ":graal_darwin_to_linux_via_docker",
    toolchain_type = ":toolchain_type",
)