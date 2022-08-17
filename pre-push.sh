#!/bin/sh

# Linting
# Override the default run command in the container to cause it to
# simply run the linter instead.
# Output is in the both in STDOUT & in the Docker Desktop GUI logs
# for the container

# Assume we will exit with a successful status
status=1

LINT=$(docker compose run web pylint --recursive=y /opt/service)

if test -n "$LINT"
then
    echo >&2 "Correct errors in linting found in Docker Desktop logs, push abandoned."
    status=1
fi

TEST=$(docker compose run web pytest /opt/service/app/routes.py)

if test -n "$TEST"
then
    echo >&2 "Correct test failures found in Docker Desktop logs, push abandoned."
    status=1
fi

exit $STATUS
