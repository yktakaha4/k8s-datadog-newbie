#!/bin/bash -eu

./manage.py migrate
./manage.py loaddata sample_db.json

./manage.py runserver
