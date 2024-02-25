#!/bin/sh

if [ ! -z "$1" ]; then
	source $1
fi

cd $(dirname $0)


if [ -z "$REDIS_CACHE_PLUGIN_VERSION" ]; then
	echo "REDIS_CACHE_PLUGIN_VERSION is not set" >&2
elif [ -f "redis-cache.${REDIS_CACHE_PLUGIN_VERSION}.zip" ]; then
	echo "redis-cache plugin version ${REDIS_CACHE_PLUGIN_VERSION} already downloaded"
else
	echo "Downloading redis-cache plugin version ${REDIS_CACHE_PLUGIN_VERSION}"
	curl -O "https://downloads.wordpress.org/plugin/redis-cache.${REDIS_CACHE_PLUGIN_VERSION}.zip"
fi

if [ -z "$WP_VERSION" ]; then
	echo "WP_VERSION is not set" >&2
elif [ -f "wordpress-${WP_VERSION}.tar.gz" ]; then
	echo "WordPress version ${WP_VERSION} already downloaded"
else
	echo "Downloading WordPress version ${WP_VERSION}"
	curl -O "https://wordpress.org/wordpress-${WP_VERSION}.tar.gz"
fi
