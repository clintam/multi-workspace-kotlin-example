load("@io_bazel_rules_kotlin//kotlin:kotlin.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "foo-service",
    srcs = glob(["*.kt"]),
    visibility = ["//visibility:public"],
    deps = [
        "@lib//core"
    ]
)
