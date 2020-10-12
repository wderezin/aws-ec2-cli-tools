
function ssm-env {
  for VAR in $(ssm-vars)
  do
    eval export $VAR
  done
}