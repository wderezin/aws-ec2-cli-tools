
function setup-aws-environment {
  if [[ "${AWS_DEFAULT_REGION}" == "" ]]
  then
    export AWS_DEFAULT_REGION=$(curl -s --connect-timeout 3 -s http://169.254.169.254/latest/dynamic/instance-identity/document/ | jq -r '.region')
  fi

  while read VAR
  do
    eval export $VAR
  done < <(aws-env-vars)

}
export -f setup-aws-environment