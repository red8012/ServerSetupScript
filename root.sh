#!/bin/bash
set -e
echo 'Welcome to ServerSetupScript'

function getCurrentDir() {
    local current_dir="${BASH_SOURCE%/*}"
    if [[ ! -d "${current_dir}" ]]; then current_dir="$PWD"; fi
    echo "${current_dir}"
}

function promptForPassword() {
   PASSWORDS_MATCH=0
   while [ "${PASSWORDS_MATCH}" -eq "0" ]; do
       read -s -rp "Enter new UNIX password:" password
       printf "\n"
       read -s -rp "Retype new UNIX password:" password_confirmation
       printf "\n"

       if [[ "${password}" != "${password_confirmation}" ]]; then
           echo "Passwords do not match! Please try again."
       else
           PASSWORDS_MATCH=1
       fi
   done
}

current_dir=$(getCurrentDir)
source "${current_dir}/setupLibrary.sh"


username="user"
promptForPassword
addUserAccount "${username}" "${password}"
usermod -aG sudo user
disableSudoPassword "${username}"
configureNTP
