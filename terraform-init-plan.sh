#!/bin/sh
set -x

#terraform -chdir=environments/$ENV_NAME init -reconfigure -input=false

#terraform -chdir=environments/$ENV_NAME plan -input=false -var-file="../../variables/$ENV_NAME.tfvars"

#terraform -chdir=environments/$ENV_NAME apply -auto-approve -input=false -var database_password=$TF_VAR_database_password -var-file="../../variables/$ENV_NAME.tfvars"

terraform -chdir=modules/ec2 init -reconfigure -input=false

terraform -chdir=modules/ec2 plan -input=false -var-file="../../variables/$ENV_NAME.tfvars"

terraform -chdir=modules/ec2 apply -auto-approve -input=false -var database_password=$TF_VAR_database_password -var-file="../../variables/$ENV_NAME.tfvars"
