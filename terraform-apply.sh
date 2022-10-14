#!/bin/sh
set -x

#terraform -chdir=environments/$ENV_NAME apply -auto-approve -input=false -var-file="../../variables/$ENV_NAME.tfvars"

terraform -chdir=modules/ec2 apply -auto-approve -input=false -var-file="../../variables/$ENV_NAME.tfvars"
