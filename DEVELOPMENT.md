# Set-up for local development

Since the used [GHC] version and preferred [cabal] version is subject to change, refer to the project files to learn the current versions. This is illustrated with `grep` commands below.

```sh
# clone:
git clone https://github.com/lazamar/haskell-docs-cli.git
cd haskell-docs-cli

# install project GHC version + make sure versioned ghc binary is on PATH:
grep 'with-compiler:' cabal.project
  # with-compiler: ghc-9.12.2
ghcup install ghc 9.12.2
command -v ghc-9.12.2 >/dev/null && echo OK
  # OK

# OPTIONAL:
# install project-preferred cabal version + make unversioned `cabal` on PATH refer to it:
grep -o 'cabal-version:.*' .github/workflows/haskell.yml
  # cabal-version: '3.14.2.0'
ghcup install cabal 3.14.2.0
ghcup set cabal 3.14.2.0
cabal --version
  # cabal-install version 3.14.2.0
  # compiled using version 3.14.2.0 of the Cabal library

# build, run tests:
cabal build
./test/test.sh
```

# About cabal version

The project-preferred [cabal] version is the one used in CI (Github Workflows). Presumably, this version was chosen after verifying that [HLS] loads the project correctly using it, so in case of problems with [HLS] it is recommended to make [HLS] use that version.

# Suggested workflow for bumping GHC and dependencies versions

### Verify locally

Do:
* choose and use some desired [cabal] version
* choose a [GHC] version (preferrably with official [HLS] support)
* modify `cabal.project` ([GHC] version and possibly dependency fixes)
* generate a new `cabal.project.freeze` file, and possibly modify it manually if needed

Verify that:
* the project builds
* tests pass
* [HLS] loads the project without errors (force [HLS] to use the chosen [cabal] version)

### Verify CI

Do:
* modify `.github/workflows/haskell.yml` with the new [GHC] and [cabal] versions

Verify that:
* CI passes for all platforms

[cabal]: https://cabal.readthedocs.io
[HLS]: https://haskell-language-server.readthedocs.io/
[GHC]: https://www.haskell.org/ghc/