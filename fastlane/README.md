fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
### gen_provision
```
fastlane gen_provision
```
Generate fresh mobileprovision
### get_ipa_info
```
fastlane get_ipa_info
```
Get ipa version, build, bundle id and name
### iterate_over_ipas
```
fastlane iterate_over_ipas
```
Scan all the ipas in `ipas` folder
### create_plists
```
fastlane create_plists
```
Creates plist files for ad hoc download
### resign_ipas
```
fastlane resign_ipas
```
Resign ipas with mobileprovision
### upload_ipa
```
fastlane upload_ipa
```
Upload ipa to github release section
### create_readme
```
fastlane create_readme
```
Generate readme based on ipas available
### full_update
```
fastlane full_update
```
Run full update of mobileprovision, ipas and readme
### update
```
fastlane update
```
Run update of ipas and readme

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
