# debian-dependency-metapackages
Packages to install dependencies on Debian-like systems

When compiling something from source or installing certain software, you'll often see instructions to do something like run `sudo apt install libfoo-dev bar build-essential`. If you later want to clean up afterwards, it can be hard to keep track of which of those you installed for that, and what can or can't be removed.

Building packages requires the `equivs-build` command, provided by Debian's `equivs` package. While certainly ironic, to install, you must run `sudo apt install equivs`.

To build a package from this repository, simply navigate to its directory, and run `equivs-build control`.
