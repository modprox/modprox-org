---
title: "Getting Setup"
anchor: "contributing-setup"
weight: 10
---

#### Repositories

modprox is broken up into a handful of git repositories

 - [mp](https://github.com/modprox/mp) houses the registry and proxy
 - [modprox-org](https://github.com/modprox/modprox-org) contains static content for this very docs site
 - [taggit](https://github.com/modprox/taggit) contains a convenient tool for creating semver git tags

#### Tooling

For hacking on the registry and proxy, a few external tools are required.

- [go1.11](https://golang.org/dl/)+ is required, since modprox itself uses Go modules
for managing third party dependencies. Make sure `GO111MODULE=on` is exported in the
environment so that the `go` command knows to use modules.

- [mockery](https://github.com/shoenig/mockery) is used for generating mocks which are then used
in test cases.

- [docker](https://www.docker.com) is recommended (but not required) for running locally.
We use docker as a convenient way to run local services like MySQL, datadog, etc. for experimenting
with changes while doing development work.

- [docker-compose](https://docs.docker.com/compose/) is used in conjunction with docker for
managing a set of containers in unision, for super easy testing cycles.

- [petrify](https://github.com/shoenig/petrify/) is used to convert static files into Go source code that can be compiled into your executable.
