
function ec2tags-env {
  for VAR in $(ec2tags-vars)
  do
    eval export $VAR
  done
}
export -f ec2tags-env
