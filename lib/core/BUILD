load("@io_bazel_rules_kotlin//kotlin:kotlin.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "core",
    srcs = glob(["*.kt"]),

    # THIS CAUSES ISSUE
    resources = glob(["resources/**"]),

    visibility = ["//visibility:public"],
    deps = [
    ]
)
