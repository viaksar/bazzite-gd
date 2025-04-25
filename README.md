# bazzite-gd

Custom build [Bazzite Handheld](https://github.com/ublue-os/bazzite), based on GHCR-imageе, with packages:
- Unity Hub
- Brave Browser
- Visual Studio Code
- gdb, clang
- GNOME Screensaver

## Using

1. Go to this build:

   ```bash
   sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/viaksar/bazzite-gd:latest
   ```

2. Update:

   ```bash
   rpm-ostree update
   ```

Image automatically rebuild through GitHub Actions.
