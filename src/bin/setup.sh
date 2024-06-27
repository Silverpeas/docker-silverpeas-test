#!/usr/bin/env bash

migrate_jcr() {
  # figure out the data home directory (by default it is into the Silverpeas home directory)
  data_home=`grep "SILVERPEAS_DATA_HOME[ ]*=" "${SILVERPEAS_HOME}/configuration/config.properties"  | cut -d '=' -f 2 | xargs`
  if [ "Z${data_home}" = "Z" ]; then
    data_home="${SILVERPEAS_HOME}/data"
  else
    data_home=`sed -e "s/{env./{/g" <<< "${data_home}"`
    data_home=`eval echo -e "${data_home}"`
  fi

  # figure out now the JCR home directory (by default it is located into the data home directory)
  jcr_home=`grep "JCR_HOME[ ]*=" "${SILVERPEAS_HOME}/configuration/config.properties"  | cut -d '=' -f 2 | xargs`
  if [ "Z${jcr_home}" = "Z" ]; then
    jcr_home="${data_home}/jcr"
  else    
    jcr_home=`sed -e "s/SILVERPEAS_DATA_HOME/data_home/g" <<< "${jcr_home}"`
    jcr_home=`eval echo -e "${jcr_home}"`
  fi

  jcr_dir=`dirname ${jcr_home}`
  if [ -d "${jcr_dir}/jackrabbit" ] && [ ! -d "${jcr_dir}/jcr/segmentstore" ]; then
    echo "Migrate the JCR from Apache Jackrabbit 2 to Apache Jackrabbit Oak..."
    if ! /opt/oak-migration/oak-migrate.sh "$jcr_dir/jackrabbit" "$jcr_dir/jcr"; then
      exit 1
    fi
  fi
}

echo "Installation of Silverpeas $1"
./h2database start
./silverpeas clean install
migrate_jcr
ret=$?
if [ $ret -eq 0 ]; then
   rm ../log/build-*
   touch .install
else
  echo "An error has occurred :-("
  echo
  for f in ../log/build-*; do
    cat "$f"
  done
fi
./h2database stop
exit $ret