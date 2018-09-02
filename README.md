modprox-org
===========

This repository is the home for the source files which are used to generate the content for modprox.org.

## Requirements

The site is generated using the popular [hugo](https://gohugo.io/getting-started/quick-start/) static
website generator. You'll need to have it installed locally in order to run it as a local development
webserver and to generate the final static content for deployment.

## Theme

The theme being used is [kraiklyn](https://themes.gohugo.io/kraiklyn/). Additional theme-specific
documentation can be found in the project's [repository](https://github.com/jsnjack/kraiklyn/).

## Build & Run

The script `build.sh` can be used to startup a `hugo` server in local mode for testing changes. To
to this, simply run the `build.sh` script with no arguments (make sure hugo is installed first).
The `hugo` server automatically reloads changes to any files, and makes the change visible without
needing to restart.

By default the local development server uses `localhost` as the base URL and `127.0.0.0` as the bind
address. These values can be configured by setting the HUGO_BASE_URL and HUGO_BIND_ADDR environment
variables before running the `build.sh` script.

## Publish

The script `build.sh` can be used to publish an archive of the generated static site, for use in a
production environment behind a normal static file server (e.g. caddy).
