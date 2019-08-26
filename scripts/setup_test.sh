#!/bin/bash
set -e
NODE_ENV=test

# create db
setupDb() {
  psql -c 'drop database if exists republisher_test' -U postgres
  psql -c 'create database republisher_test' -U postgres
}

setupDb
echo "Done!!!"
exit