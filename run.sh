#!/bin/bash

export PYTHONPATH=".:$PYTHONPATH"
export DJANGO_SETTINGS_MODULE="test_settings"

usage() {
    echo "USAGE: $0 [command]"
    echo "  test - run the ratelimit tests"
    echo "  flake8 - run flake8"
    echo "  shell - open the Django shell"
    exit 1
}


case "$1" in
    "test" )
        shift;
        echo "Django version: $(django-admin.py --version)"
        django-admin.py test ratelimit "$@";;
    "flake8" )
        shift;
        echo "Flake8 version: $(flake8 --version)"
        flake8 "$@" ratelimit/;;
    "shell" )
        django-admin.py shell ;;
    * )
        usage ;;
esac
