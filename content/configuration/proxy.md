---
title: "Proxy Settings"
anchor: "proxy-configuration"
weight: 60
---

Example JSON [config](https://github.com/modprox/modprox-proxy/blob/master/hack/configs/local.json)
file for the proxy.

#### Proxy API Server Configuration

##### `api_server.bind_address`

The address on which to bind the web server. Typically this value will be `0.0.0.0` in production
environments, and `127.0.0.1` for local development.

##### `web_server.port`

The TCP port on which the web server will listen for new connections.

##### `web_server.tls.enabled`

Toggle for whether the registry should launch with TLS enabled. If true, the other config values
in the `tls` map must be set. If false, the registry will launch with TLS disabled, and the other
config values in the `tls` map will be ignored. It is strongly recommended to run with TLS configured
in production environments.

##### `web_server.tls.certificate`

The filepath to the certificate file to use for TLS connections.

##### `web_server.tls.key`

The filepath to the key file to use for TLS connections.

#### Proxy -> Registry Service Discovery Configuration

The proxy initiates contacts with the registry, informing the registry of its existence. To do so,
currently the proxy must be pre-configured with information about each registry instance.

##### `registry.instances.[].address`

The address of one registry instance.

##### `registry.instances.[].port`

The port of one registry instance, associated with the address.

##### `registry.poll_frequency_s`

The number of seconds to wait in between requests to the registry, polling for updates. When
new modules are added into the registry, they are not servable from the proxy instances until
they poll the registry and discover that new modules need to be made available.

#### Proxy Module Storage Configuration

##### `module_storage.path`

The filepath of the directory into which Go modules will be downloaded from upstream and saved
locally. The content of this directory has the potential to become very large over time, as more
and more versions of modules are stored.

When modules are downloaded into this directory, the layout will look something like this:
```bash
$ tree
.
└── github.com
    ├── pkg
    │   └── errors
    │       ├── v0.7.1.info
    │       ├── v0.7.1.mod
    │       ├── v0.7.1.zip
    │       ├── v0.8.0.info
    │       ├── v0.8.0.mod
    │       └── v0.8.0.zip
    └── rboyer
        └── safeio
            ├── v0.1.0.info
            ├── v0.1.0.mod
            └── v0.1.0.zip

5 directories, 9 files
```

It should not be necessary to serve this content from an expensive SSD/NVMe, large rotating rust platters
will likely be sufficient.

#### Proxy Request Transforms Configuration

Each proxy individually makes requests to upstream servers. Typically these upstream providers are
version control systems like github or gitlab (either external or internally hosted).

The value of modprox comes from being able to define "transforms" which are then used to compute
a final request URI for a module. The current available transform types are able to:

- define domains which require redirects, via static substitution
- define domains which require redirects, `go-get` meta-tag style
- define HTTP request headers for specific domains
- define arbitrary HTTP URL Path manipulations