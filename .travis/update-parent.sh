#!/bin/bash
# set -x

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <parent-repo> <submodule-dir-in-parent>";
    exit 1;
fi

PARENT_REPO=$1
SUBMODULE_DIR=$2

# Get the source code of the PARENT_REPO
git clone "https://github.com/attachix/${PARENT_REPO}.git"
cd "${PARENT_REPO}"
git submodule update --init "$SUBMODULE_DIR"

# Update the SUBMODULE_DIR
cd "${SUBMODULE_DIR}"
git pull origin master

# Push the changes to the PARENT_REPO
cd ../
git commit -a -m "Updated $SUBMODULE_DIR to its latest version".
git push "https://${ATX_TOKEN}@github.com/attachix/${PARENT_REPO}.git"

