REM start consul agent -config-dir=/config -join consul
start consul agent -config-dir=/config
if "%1" == "cmd" (
  %*
) else (
  node %*
)
