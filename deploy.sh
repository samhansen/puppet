#!/bin/bash

function usage() {
  echo "$0 -d <home dir> -u <user> [-g <group=eng>] help|install|test " && exit $1
}

group=sam

while getopts ':d:g:u:' opt; do
  case ${opt} in
  d)
    home=${OPTARG}
    ;;
  g)
    group=${OPTARG}
    ;;
  u)
    user=${OPTARG}
    ;;
  ?)
    usage 1
    ;;
  esac
done
shift $((OPTIND - 1))

if [ -z "${user}" ] || [ -z "${home}" ]; then
  usage 1
fi

case $1 in
  install)
    FACTER_user=${user} FACTER_group=${group} FACTER_home=${home} puppet apply \
      --modulepath=modules \
      manifests/site.pp
    ;;
  test)
    FACTER_user=${user} FACTER_group=${group} FACTER_home=${home} puppet apply \
      --modulepath=modules \
      --noop \
      manifests/site.pp
    ;;
  help)
    usage 0
    ;;
  *)
    usage 1
    ;;
esac
