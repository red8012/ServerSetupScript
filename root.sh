#!/bin/bash
set -e
echo 'Welcome to ServerSetupScript'

function getCurrentDir() {
    local current_dir="${BASH_SOURCE%/*}"
    if [[ ! -d "${current_dir}" ]]; then current_dir="$PWD"; fi
    echo "${current_dir}"
}

current_dir=$(getCurrentDir)
source "${current_dir}/setupLibrary.sh"
