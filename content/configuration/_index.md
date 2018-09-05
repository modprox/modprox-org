---
title: "Configuration"
anchor: "configuration"
weight: 30
---

Both the registry and the proxy components are configured through structs ([registry](poop), [proxy](poop))
which define what values can be set. Typically users of the pre-packaged binaries will configure the registry
and the proxy through JSON, however it is also possible to use the registry and proxy as libraries from some
other `main` package. In that case, a pre-filled instance of the configuration struct is simply passed in to
the `[registry]. That way the configuration values can be specified using any mechanism 
(yaml, toml, consul-template, etc.) provided by the main package implementor.

