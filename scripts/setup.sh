#!/bin/bash
set -e

NODE_ENV=development

# create db
setupDb() {
  echo "Setting up db..."
  
  psql -c ~/learning/replublisher/src/config/replublisher.sql
}

# install dependencies
installDeps() {
  echo "Installing deps..."
  npm install
  
  return 1
}

setupDb
echo "Done!!!"
exit