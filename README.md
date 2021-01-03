# Godot "vintage" builds

This repository contains compiled binaries of old Godot versions for your
nostalgia needs. Build scripts and instructions are also included.

There are currently two versions available:

- Godot 1.0, released in December 2014.
- "Godot 0" (early open source commits from February 2014).
  [`b0870e487`](https://github.com/godotengine/godot/commit/b0870e487c6cc68bb0a2cef7174f3f5697667a2e)
  is not the first commit, but it includes some essential fixes made after the
  open sourcing of Godot.

See [downloads.tuxfamily.org](https://downloads.tuxfamily.org/godotengine/)
for more recent old versions (going back to Godot 1.1, released in May 2015).

## Disclaimer

These builds are not meant to be used in a production environment
:slightly_smiling_face:

Use the [official Godot builds](https://godotengine.org/download/) for
production. Thanks to 2D batching, Godot 3.2.2 and later should still be
efficient on low-end machines.

If you *really* need a version of Godot that is the frugal possible in terms of
RAM usage, use [Godot 2.1.6](https://downloads.tuxfamily.org/godotengine/2.1.6/).
However, it has very few users remaining, which means people will not be able to
assist you with any questions you have.

## Downloads

- **Head to the [Releases](https://github.com/Calinou/godot-vintage-builds/releases)
  tab of this repository for downloads.**

## Running

Godot versions below 3.0 only have a GLES2 renderer, making them compatible with
almost any graphics card.

Run the Godot editor binary as you'd do usually. You can use the demo projects
below to test their functionality:

- [Demo projects for Godot 1.0](https://github.com/godotengine/godot-demo-projects/archive/4521b6b8798544e1cbf6ebb137649b92f2e038c5.zip)
- [Demo projects for "Godot 0"](https://github.com/godotengine/godot-demo-projects/archive/ccfc7d19b9c1a8f5bdd0efc53eecaf8dcb28afb1.zip)

Use the **Scan** button in the Project Manager to import all demos easily.

## Development

### Compiling for Linux

This can be done from Linux or macOS. If you're on Windows, you can use a Linux
virtual machine.

- Install [Docker](https://www.docker.com/) or [Podman](https://podman.io/).
  - Podman requires less permissions than Docker and should be easier to set up on Linux.
- Run `build_linux.sh`.
- An x86_64 Linux binary will be available in the `bin/` folder once the build is completed.

### Compiling for Windows

This must be done from Windows. The guide below uses MSVC 2013. More recent
versions of MSVC aren't supported. MinGW is in theory supported, but recent
versions won't work either.

If you're not running Windows natively, you can use a virtual machine.

- Install [Visual Studio 2013](https://visualstudio.microsoft.com/vs/older-downloads/)
  (*Community with Update 5*).
  - You need a Microsoft account to download it. Make sure to log in beforehand
    *then* click on the **Download** button. Otherwise, you won't see the
    download link.
  - Visual Studio 2013 can still be run on the latest Windows 10 updates.
    It can be safely installed alongside other Visual Studio versions.
- Install [Python 2.7.18](https://www.python.org/ftp/python/2.7.18/python-2.7.18.amd64.msi)
  to `C:\Python27`. Leave the options to their defaults.
- Download [SCons 2.5.1](prdownloads.sourceforge.net/scons/scons-local/2.5.1/scons-local-2.5.1.zip)
  and extract it to `C:\SCons`. Make sure `scons.py`'s path is `C:\SCons\scons.py`.
- Download a ZIP archive of the Godot Git repository at the desired point of time.
  - For 1.0, this is <https://github.com/godotengine/godot/archive/1.0-stable.zip>.
- Open the Start Menu, navigate to **Visual Studio 2013** and click on
  **Visual Studio Tools**. In the Explorer window that appears, double-click
  **VS2013 x64 Native Tools Command Prompt**.
  - For "Godot 0", you'll need to use **VS2013 x86 Native Tools Command Prompt** instead.
    Compiling that version for 64-bit Windows didn't work here.
- In the command prompt that appears, use `cd` to reach the Godot directory then run:

```batch
C:\Python27\python.exe C:\SCons\scons.py platform=windows target=release_debug
```

Compiling with more than 1 CPU thread will most likely not work as expected
unless you have Pywin32 extensions installed.

### Packaging for distribution

For a smaller download size, a ZIP archive can be created using
`7z a -mx9 file.zip file`. This creates a ZIP archive more efficiently than `zip`,
but it's still compatible with all modern extractors (not just 7-zip).

Using `7z a -mx9` is significantly slower to compress than `zip -r9`,
but decompression speed remains almost identical.
