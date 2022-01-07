"""
Toolchain implementation for native-image AOT compiled binary
"""

GraalNativeImageInfo = provider(
    doc = "Information about how to invoke the Graal native-image compiler.",
    fields = [
        # Resolved path to `native-image` binary.
        "native_image_path", 
    ],
)

def _graal_toolchain_impl(ctx):
    native_image_attr = ctx.attr.native_image_path
    native_image_inputs, _, _ = ctx.resolve_tools(tools = [native_image_attr])
    native_image = native_image_inputs[0]

    toolchain_info = platform_common.ToolchainInfo(
        graalinfo = GraalNativeImageInfo(
            native_image_path = native_image,
        ),
    )
    return [toolchain_info]

graal_toolchain = rule(
    implementation = _graal_toolchain_impl,
    attrs = {
        "native_image_path": attr.label(
            cfg = "exec",
            # default = "@graal//:bin/native-image",
            allow_single_file = True,
            executable = True,
        ),
    },
)