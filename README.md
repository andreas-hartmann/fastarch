# fastarch
My personal basic arch setup - you can use it too!

The purpose of this script is to quickly install all the tools that I expect to have on every single one of machines. All systems will install paru and git as well as all packages listed in packages_base. If packages_base contains fish (which it does by default), then the fish config will be copied over and fish will be set as the default shell for current user. You will be asked whether you are setting up a client or a server or neither. Depending on your choice, packages_client or packages_server may be installed.

Usage:

Fork this repo, customize and clone it onto your new Arch install then run:

`./setup.sh`
