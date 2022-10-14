#!/bin/sh
set -x

#terraform -chdir=environments/$ENV_NAME destroy -auto-approve -input=false -var-file="../../variables/$ENV_NAME.tfvars"

terraform -chdir=modules/ec2 destroy -auto-approve -input=false -var-file="../../variables/$ENV_NAME.tfvars"