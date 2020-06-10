#!/usr/bin/env bash

echo "Installation of Silverpeas $1"
if [ "$1" = "6.1" ]; then
  # it is a workaround to a misnamed SQL migration script for H2
  ./silverpeas clean assemble
  mv ../migrations/db/h2/busCore/up040/alter-table.sql ../migrations/db/h2/busCore/up040/alter_table.sql
  ./silverpeas install
else
  ./silverpeas clean install
fi
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
exit $ret