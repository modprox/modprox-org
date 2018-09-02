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
	echo "todo, this"
	exit 1
fi


echo "unknown command '${1}'"
