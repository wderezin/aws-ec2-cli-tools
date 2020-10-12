
function ssm-env {
  setup-aws-environment
  ec2tags-env

  if [[ ! -z $SSM_PREFIX ]]
  then
    eval $(aws ssm get-parameters-by-path --path $SSM_PREFIX --with-decryption --no-paginate  --query 'Parameters[*].[Name,Value]' --output=text | while read KEY VALUE
      do
        KEY=$(basename ${KEY} |  tr a-z-: A-Z__ )
        echo export ${KEY}=\"${VALUE}\"
      done
      )
  fi
}