## Overview

I have a setup like:
* one `core` workspace that builds a simple kotlin lib
* one `service` workspace that uses the core lib to build another kotlin lib

I'm using `local_repository` to give service access to the core library.

This works fine until I add a `resources` block. At which point I get
```
$ make reproduce-issue 
cd service && bazel build --sandbox_debug //...:all
INFO: Analyzed target //foo-service:foo-service (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
ERROR: /private/var/tmp/_bazel_clint/b53724a1440ea0c7b3240e82ef70f0e9/external/lib/core/BUILD:3:1: error executing shell command: '/bin/bash -c external/bazel_tools/tools/zip/zipper/zipper c bazel-out/darwin-fastbuild/bin/external/lib/core/core-resources.jar @bazel-out/darwin-fastbuild/bin/external/lib/core/core_resources_zipp...' failed (Exit 255) sandbox-exec failed: error executing command 
  (cd /private/var/tmp/_bazel_clint/b53724a1440ea0c7b3240e82ef70f0e9/sandbox/darwin-sandbox/40/execroot/service && \
  exec env - \
    TMPDIR=/var/folders/3m/vrx61wv966jg1jw_0wfl5nnw0000gn/T/ \
  /usr/bin/sandbox-exec -f /private/var/tmp/_bazel_clint/b53724a1440ea0c7b3240e82ef70f0e9/sandbox/darwin-sandbox/40/sandbox.sb /var/tmp/_bazel_clint/install/8ee987d32e94b9a7b51ef6034faefef4/process-wrapper '--timeout=0' '--kill_delay=15' /bin/bash -c 'external/bazel_tools/tools/zip/zipper/zipper c bazel-out/darwin-fastbuild/bin/external/lib/core/core-resources.jar @bazel-out/darwin-fastbuild/bin/external/lib/core/core_resources_zipper_args')
File ../lib/core/resources/foo.txt does not seem to exist.Target //foo-service:foo-service failed to build
Use --verbose_failures to see the command lines of failed build steps.
INFO: Elapsed time: 0.124s, Critical Path: 0.03s
INFO: 0 processes.
FAILED: Build did NOT complete successfully

```

### Reproduction

* `make reproduce-issue`
* (BUG) observe build failure
* comment out resources in lib/core/BUILD
* `make reproduce-issue`
* observe this works
