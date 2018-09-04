---
title: "Getting Setup"
anchor: "contributing-setup"
weight: 10
---

#### Repositories

modprox is broken up into a handful of git repositories

 - [modprox-registry](https://github.com/modprox/modprox-registry) houses the registry component
 - [modprox-proxy](https://github.com/modprox/modprox-proxy) houses the proxy component
 - [modprox-org](https://github.com/modprox/modprox-org) contains static content for this very docs site
 - [libmodprox](https://github.com/modprox/libmodprox) contains common code shared between components
 - [taggit](https://github.com/modprox/taggit) contains a convenient tool for creating semver git tags

#### Tooling

For hacking on modprox-registry or modprox-proxy, a few external tools are required.

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

