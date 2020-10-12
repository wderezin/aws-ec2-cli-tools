
function ssm-env {
  while read VAR
  do
    eval export $VAR
  done < <(ssm-vars)
}
export -f ssm-env