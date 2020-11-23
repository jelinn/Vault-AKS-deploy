#!/bin/sh

OUTPUT=/tmp/output.txt
export VAULT_ADDR=https://127.0.0.1:8200
export VAULT_SKIP_VERIFY=true

vault operator init -n 1 -t 1 >> ${OUTPUT?}
root=$(cat ${OUTPUT?} | grep "Initial Root Token:" | sed -e "s/Initial Root Token: //g")

vault login -no-print ${root?}

vault auth enable userpass

vault policy write admin admin-policy.hcl
vault write auth/userpass/users/jelinn password="password" policies="admin"
