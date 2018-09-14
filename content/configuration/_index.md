---
title: "Configuration"
anchor: "configuration"
weight: 30
---

Both the registry and the proxy components are configured through structs
([registry](https://github.com/modprox/mp/blob/master/registry/config/config.go),
[proxy](https://github.com/modprox/mp/blob/master/proxy/config/config.go))
which define what options can be set. Typically users of the pre-packaged binaries / `main` packages
will configure the registry and the proxy through JSON files, however it is also possible to use
the registry and proxy as libraries from some other `main` package. In that case, a pre-filled
instance of the configuration struct is simply passed in to the library sub-package. That way the
configuration values can be specified using any mechanism (yaml, toml, consul-template, etc.)
provided by the main package implementor.

