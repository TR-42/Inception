#!/bin/sh

cd $(dirname $0)/srcs

source ./.env

echo "Removing mount directories... '${VOLUME_MOUNT_POINT}/*'"

if [ -z "${VOLUME_MOUNT_POINT}" ]; then
  echo "VOLUME_MOUNT_POINT is not set" >&2
  exit 1
fi

sudo rm -rf\
  ${VOLUME_MOUNT_POINT}/${VOLUME_ADMINER_DIR}\
  ${VOLUME_MOUNT_POINT}/${VOLUME_WP_DIR}\
  ${VOLUME_MOUNT_POINT}/${VOLUME_MARIADB_DIR}\
