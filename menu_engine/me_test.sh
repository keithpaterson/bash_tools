_my_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Run `me_test.sh` from the checked out folder only.
# To test the "self-install" feature run `me_test_se.sh` instead
ME_CATEGORY_DIR=${_my_dir}/tests
source ${_my_dir}/menu_engine.sh

