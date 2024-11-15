using colors

run_deploy_usage() {
  echo "  where $(color -bold op) is:"
  echo "    ui: deploy ui stuff"
  echo "    service: deploy the service"
  echo "    both: deploy the ui and service"
}

run_deploy() {
  local _op=$1
  case ${_op} in
    -h|--help)
      run_handler_usage deploy
      exit 1
      ;;
    ui)
      echo "** deploy the ui!! **"
      ;;
    service)
      echo "** deploy the service!! **"
      ;;
    both)
      echo "** deploy the ui and the service!! **"
      ;;
    *)
      error "unknown op $(color -bold ${_op})"
      exit 1
      ;;
  esac
}
