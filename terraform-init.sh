#!/bin/sh
set -x

#terraform -chdir=environments/$ENV_NAME init -reconfigure -input=false

terraform -chdir=modules/ec2 init -reconfigure -input=false
