set prefixes_any=-prefix dc/home/environment/service/any/tag/any/
set prefixes_service=-prefix dc/home/environment/service/%SERVICE_NAME%/tag/any/

start consul agent -config-dir=/config
if "%1" == "cmd" (
  %*
) else (
  envconsul -consul %CONSUL_HOST%:8500 -sanitize -upcase %prefixes_any% %prefixes_service% node %*
)
