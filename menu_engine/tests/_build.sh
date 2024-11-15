using colors

run_build_usage() {
  echo "  where $(color -bold op) is:"
  echo "    some: build some stuff"
  echo "    all: build all the stuff"
}

run_build() {
  local _op=$1
  case ${_op} in
    -h|--help)
      run_handler_usage build
      exit 1
      ;;
    some)
      echo "** build some stuff!! **"
      ;;
    all)
      echo "** build all the stuff!! **"
      ;;
    *)
      error "unknown op $(color -bold ${_op})"
      exit 1
      ;;
  esac
}
