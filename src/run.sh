#!/usr/bin/env bash
set -e

#
# Initialization script that wraps the configuration, starting and stopping
# of Silverpeas
#

configure_silverpeas() {
  echo "Configure Silverpeas..."
  local configure=0
  if [ "Z${locale}" != "Z" ]; then
    echo " -> set locale to ${locale}"
    echo "SILVERPEAS_USER_LANGUAGE=${locale}" >> "${SILVERPEAS_HOME}"/configuration/config.properties
    echo "SILVERPEAS_CONTENT_LANGUAGES=${locale}" >> "${SILVERPEAS_HOME}"/configuration/config.properties
    configure=1
  fi
  if [ -f "${SILVERPEAS_HOME}/configuration/custom_config.properties" ]; then
    echo " -> set custom configuration from custom_config.properties"
    sed -e "s/DB_.*$//g" "${SILVERPEAS_HOME}"/configuration/custom_config.properties > "${SILVERPEAS_HOME}"/configuration/custom_config.fixed.properties
    cat "${SILVERPEAS_HOME}"/configuration/custom_config.fixed.properties >> "${SILVERPEAS_HOME}"/configuration/config.properties
    rm "${SILVERPEAS_HOME}"/configuration/custom_config.fixed.properties
    configure=1
  fi
  if [ -f "${SILVERPEAS_HOME}/configuration/silverpeas/CustomerSettings.xml" ] || [ -f "${SILVERPEAS_HOME}/configuration/silverpeas/CustomSettings.xml" ]; then
    echo " -> custom settings detected in CustomerSettings.xml or CustomSettings.xml"
    configure=1
  fi
  if [ $configure -ne 0 ]; then
    ./silverpeas configure
  fi
}

start_silverpeas() {
  "${SILVERPEAS_HOME}"/bin/h2database start

  echo "Start Silverpeas..."
  "${JBOSS_HOME}"/bin/standalone.sh -b 0.0.0.0 -c standalone-full.xml &
  local pids=`jobs -p`
  wait $pids
}

stop_silverpeas() {
  echo "Stop Silverpeas..."
  ./silverpeas stop
  local pids=`jobs -p`
  if [ "Z$pids" != "Z" ]; then
    kill $pids &> /dev/null
  fi
  
  "${SILVERPEAS_HOME}"/bin/h2database stop
}

trap 'stop_silverpeas' SIGTERM

if [ -f "${SILVERPEAS_HOME}/bin/.install" ]; then
  configure_silverpeas
  rm "${SILVERPEAS_HOME}"/bin/.install
fi

if [ -f "${SILVERPEAS_HOME}/configuration/config.properties" ] && [ ! -e "${SILVERPEAS_HOME}/bin/.install" ]; then
  start_silverpeas
else
  echo "No ${SILVERPEAS_HOME}/configuration/config.properties found! No start!"
  exit 1
fi


