
function ec2tags-env {
  while read VAR
  do
    eval export $VAR
  done < <(ec2tags-vars)
}
export -f ec2tags-env
