#!/bin/bash -eu

until ./manage.py migrate --plan >/dev/null 2>&1; do
  echo >&2 "wait for db..."
  sleep 5
done

./manage.py migrate
./manage.py loaddata sample_db.json

./manage.py runserver
