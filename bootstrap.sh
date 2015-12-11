case $1 in
install)
  FACTER_user=sam puppet apply \
    --modulepath=modules \
    manifests/site.pp
  ;;
test)
  FACTER_user=sam puppet apply \
    --modulepath=modules \
    --noop \
    manifests/site.pp
  ;;
*)
  echo 'Unknown command.'
  ;;
esac
