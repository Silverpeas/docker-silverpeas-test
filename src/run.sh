#!/usr/bin/env bash

#
# Initialization script that wraps the configuration, the starting and the stopping
# of Silverpeas
#

configure_silverpeas() {
  echo "Generate ${SILVERPEAS_HOME}/configuration/config.properties..."
  cp ${SILVERPEAS_HOME}/configuration/db_config.properties ${SILVERPEAS_HOME}/configuration/config.properties
  if [ -f ${SILVERPEAS_HOME}/configuration/custom_config.properties ]; then
    sed -ie "s/DB_.*$//g" /configuration/custom_config.properties
    cat ${SILVERPEAS_HOME}/configuration/custom_config.properties >> ${SILVERPEAS_HOME}/configuration/config.properties
  fi
  echo "Configure Silverpeas..."
  ./silverpeas configure
}

start_silverpeas() {
  echo "Start Silverpeas..."
  /opt/ooserver start
  ${JBOSS_HOME}/bin/standalone.sh -b 0.0.0.0 -c standalone-full.xml &
  local pids=`jobs -p`
  wait $pids
}

stop_silverpeas() {
  echo "Stop Silverpeas..."
  ./silverpeas stop
  /opt/ooserver stop
  local pids=`jobs -p`
  if [ "Z$pids" != "Z" ]; then
    kill $pids &> /dev/null
  fi
}

trap 'stop_silverpeas' SIGTERM

for arg in $*; do
  case "$arg" in
    start)
      start_silverpeas
      ;;
    stop)
      stop_silverpeas
      ;;
    configure)
      configure_silverpeas
    ;;
    *)
      echo "Unknown command: $arg"
      exit 1
  esac
done

