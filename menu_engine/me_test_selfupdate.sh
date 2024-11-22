_my_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# This script demonstrates how to auto-install the menu engine from your parent script.
# This can also auto-update a previoiusly installed bash_tools.
#
# Feel free to copy and paste this code for your own parent script.

BASH_TOOLS_DIR=

# Args:
#   -r <folder> : where the bash_tools/ folder should be installed
#     * if the folder doesn't exist, will create it via `git clone`
#     * if the folder exists, will do nothing.
#     * default: ${_my_dir}/../bash_tools
#   -u : force the tools to update
#     Since `git fetc/git pull` will reach out to the remote it can cause
#     delays on script startup, so we don't do it every time.
#     This argument will cause the script to update the bash_tools repo 
#     in the case that the folder already exists.
menu_engine_install_and_update() {
  local _root=${BASH_TOOLS_DIR:=${_my_dir}/../bash_tools}
  local _update=

  while [ $# -gt 0 ]; do
    case $1 in
      -r|--root|--menu-engine-root)
        if [ -z "$2" ]; then
          echo "ERROR: -root requires a folder name"
          exit 1
        fi
        _root=$2
        shift
        ;;
      -u|--update)
        _update=true
        ;;
      *)
        echo "ERROR: unexpected argument '$1'"
        exit 1
        ;;
    esac
    shift
  done

  BASH_TOOLS_DIR=${_root}

  if [ -d ${_root} ]; then
    if [ -n "${_update}" ]; then
      # update
      echo "Updating script tools ..."
      cd ${_root}
      git pull origin main
    fi
  else
    # install
    echo "Installing script tools ..."
    git clone git@github.com:keithpaterson/bash_tools.git ${_root}
  fi
}

menu_engine_install_and_update --root ../.test_bash_tools

ME_CATEGORY_DIR=${_my_dir}/tests
source ${_my_dir}/menu_engine.sh
