---
title: "Setup"
anchor: "contributing-setup"
weight: 10
---

#### Tooling

For hacking on modprox-registry or modprox-proxy, a few external tools are required.

- [go1.11+](https://golang.org/dl/) is required, since modprox itself uses Go modules
for managing third party dependencies. Make sure `GO111MODULE=on` is exported in the
environment so that the `go` command knows to use modules.

- [mockery](github.com/shoenig/mockery) is used for generating mocks which are then used
in test cases.

- [docker](https://www.docker.com) is recommended (but not required) for running locally.
We use docker as a convenient way to run local services like MySQL, datadog, etc. for experimenting
with changes while doing development work.

- [docker-compose](https://docs.docker.com/compose/) is used in conjunction with docker for
managing a set of containers in unision, for super easy testing cycles.

#### Hacking

Some text goes here.
