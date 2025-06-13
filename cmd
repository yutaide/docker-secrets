#!/usr/bin/env bash
set -ue

JWT_SECRET=LAplust123@

function exec_cmd() {
  eval "
    CTI_PRODUCT_JWT_SECRET='$JWT_SECRET' \
    $*
  "
}

_build() {
  TARGET=${1:-myapp}
  exec_cmd docker buildx build --secret id=CTI_PRODUCT_JWT_SECRET -t $TARGET .
}

_run() {
  TARGET=${1:-myapp}
  exec_cmd docker run -d --name $TARGET $TARGET
}

_exec() {
  TARGET=${1:-myapp}
  exec_cmd docker exec -it $TARGET /bin/bash
}

_rm() {
  TARGET=${1:-myapp}
  exec_cmd docker stop $TARGET && docker rm $TARGET
}

_up() {
  exec_cmd docker compose up -d --build
}

_down() {
  exec_cmd docker compose down
}



CMD=$1
shift 1

if [ "$(type -t _$CMD)" == "function" ]; then
  _$CMD $@
fi
