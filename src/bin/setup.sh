#!/usr/bin/env bash

echo "Installation of Silverpeas $1"
/etc/init.d/postgresql start
test $? -eq 0 || exit $?

sudo -u postgres psql < ../silverpeas.sql
test $? -eq 0 || exit $?

./silverpeas clean install
ret=$?
if [ $ret -eq 0 ]; then
  rm ../log/build-*
  touch .install
  rm ../silverpeas.sql
else
  echo "An error has occurred :-("
  echo
  for f in ../log/build-*; do
    cat "$f"
  done
fi

/etc/init.d/postgresql stop
exit $ret
