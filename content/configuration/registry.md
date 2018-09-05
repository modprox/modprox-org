---
title: "Registry Settings"
anchor: "registry-configuration"
weight: 50
---

Example JSON [config](https://github.com/modprox/modprox-registry/blob/master/hack/configs/local.json)
file for the registry.

#### Registry Web Server Configuration

##### `web_server.bind_address`

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

#### Registry CSRF Configuration

Since the registry provides a webUI for management of Go modules, it is important to configure
CSRF protection. Doing so simply requires providing a secret 32 byte authentication key.

##### `csrf.development_mode`

Toggles whether the `csrf` package should enable CSRF protections for HTTP (non-HTTPS) connections.
When developing locally, it is common to not enable TLS due to inconvenience of certificates. By
setting this field to `true`, the CSRF package will enable CSRF protection for the HTTP connections,
enabling development of the CSRF logic during local development.

##### `csrf.authentication_key`

The 32 byte key to be use for CSRF token generation on every request. If this key is modified while
the registry is in use, existing user sessions will need to refresh their web browsers in order to
keep using the protected HTML forms.

#### Registry Database Storage

Currently the registry only supports one database store: MySQL. In the future, support for more
transactional, persistent storage mechanisms will be provided.

##### Settings for `database_storage.mysql`

##### `database_storage.mysql.user`

The MySQL username with which the registry can Read and Write to the database.

##### `database_storage.mysql.password`

The MySQL password which correlates with the specified username.

##### `database_storage.mysql.address`

The hostname and port of the MySQL server to connect to (in the form `hostname:port`)

##### `database_storage.mysql.database`

The name of the database where the registry's tables reside.

##### `database_storage.mysql.allow_native_passwords`

Some versions of the Go MySQL client require this setting to be `true` for using passwords.
See the [github issue](https://github.com/go-sql-driver/mysql/pull/644) for more information.
