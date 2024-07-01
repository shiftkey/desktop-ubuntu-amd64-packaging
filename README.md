# desktop-ubuntu-amd64-packaging

This repository handles the packaging steps for AMD64 architectures of the
GitHub Desktop for Linux fork.

This is a standalone workflow to build any native dependencies against an older
version of glibc, without needing to restrict other tooling to older versions
of `glibc`, so that any native binaries have the broadest support across Linux
distributions.

Currently this uses Ubuntu 18.04 and Node 20.

Credit to [**@theofficialgman**](https://github.com/theofficialgman) for help
with figuring out this approach within GitHub Actions.
