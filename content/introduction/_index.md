---
title: "Introduction"
anchor: "introduction"
weight: 10
---

[modprox](https://github.com/modprox) is a Go Module Proxy, focused on the
internal hosting use case.

{{% block note %}}
modprox is currently under development, expect bugs!
{{% /block %}}

Organizations which have an interest in keeping a permenant local copy of their
third-party dependencies will find value in the modprox registry and proxy
to manage those dependencies. The proxy is also useful in providing a private,
site-local cache of internal and external modules which can greatly reduce `go-get`
download times in remote offices.

