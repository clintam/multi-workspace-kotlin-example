reproduce-issue:
	cd service && bazel build --sandbox_debug //...:all
