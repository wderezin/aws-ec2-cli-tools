
function ec2tags-env {
  setup-aws-environment

  INSTANCE_ID=${INSTANCE_ID:-$(ec2metadata --instance-id)}

  # Show Instance Tags as variables
  eval $(aws ec2 describe-tags --filters "Name=resource-id,Values=${INSTANCE_ID}" --query 'Tags[*].[Key,Value]' --output text | while read KEY VALUE
    do
      KEY=$(echo ${KEY} |  tr a-z-: A-Z__ )
      echo export ${KEY}=\"${VALUE}\"
    done
  )
}
