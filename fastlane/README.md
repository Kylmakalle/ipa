fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### gen_provision

```sh
[bundle exec] fastlane gen_provision
```

Generate fresh mobileprovision

### get_ipa_info

```sh
[bundle exec] fastlane get_ipa_info
```

Get ipa version, build, bundle id and name

### iterate_over_ipas

```sh
[bundle exec] fastlane iterate_over_ipas
```

Scan all the ipas in `ipas` folder

### create_plists

```sh
[bundle exec] fastlane create_plists
```

Creates plist files for ad hoc download

### resign_ipas

```sh
[bundle exec] fastlane resign_ipas
```

Resign ipas with mobileprovision

### upload_ipa

```sh
[bundle exec] fastlane upload_ipa
```

Upload ipa to github release section

### create_readme

```sh
[bundle exec] fastlane create_readme
```

Generate readme based on ipas available

### full_update

```sh
[bundle exec] fastlane full_update
```

Run full update of mobileprovision, ipas and readme

### commit_update

```sh
[bundle exec] fastlane commit_update
```

Commit updated dirs

### update

```sh
[bundle exec] fastlane update
```

Run update of ipas and readme

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
