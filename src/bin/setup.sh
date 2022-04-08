#!/usr/bin/env bash

echo "Installation of Silverpeas $1"
./h2database start
./silverpeas clean install
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