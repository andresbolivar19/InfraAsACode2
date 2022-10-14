#!/bin/sh
set -x

#terraform -chdir=environments/$ENV_NAME plan -input=false -var-file="../../variables/$ENV_NAME.tfvars"

terraform -chdir=modules/ec2 plan -input=false -var-file="../../variables/$ENV_NAME.tfvars"
