#!/bin/bash

set -euo pipefail

if [ "${#}" -eq 0 ] ; then
	echo "running site in local mode"
	base_url="${HUGO_BASE_URL:-localhost}"
	bind_addr="${HUGO_BIND_ADDR:-127.0.0.1}"
	hugo server --baseURL="${base_url}" --bind="${bind_addr}" -D
	exit 0
fi

if [ "${1}" == "publish" ] ; then
	echo "publish site into archive"

	# cleanup any old files
	rm -rf /tmp/site.tar.gz /tmp/site

	# use hugo to generate the static site
	hugo -d /tmp/site

	# tar everything up
	tar -cvf /tmp/site.tar.gz /tmp/site

	# scp it over to modprox.org (todo: create a better user)
	ssh -t hoenig@modprox.org "rm -rf /tmp/site.tar.gz"
	scp /tmp/site.tar.gz hoenig@modprox.org:/tmp/site.tar.gz
	ssh -t hoenig@modprox.org "tar -C / -xf  /tmp/site.tar.gz"

	# replace the existing site directory with the new one
	ssh -t hoenig@modprox.org "sudo rsync -r --remove-source-files /tmp/site /opt/modprox-static"
	exit 0
fi


echo "unknown command '${1}'"
