#!/bin/bash

set -e

sudo apt-get update

echo "Installing requirements ..."

echo "Setting up venv"

sudo -H pip3 install virtualenv
 

echo "Entering target folder ... "

cd /home/udacityadmin/azure-voting-app-redis/

echo "Creating venv ..."

virtualenv venv

echo "Activating venv ..."

source /home/udacityadmin/azure-voting-app-redis/venv/bin/activate

echo "Installing python requirements"

pip3 install --ignore-installed pyasn1-modules -r /home/udacityadmin/azure-voting-app-redis/requirements.txt

echo "Updating ownership of the flask app folder ..."

sudo chown -R udacityadmin:udacityadmin /home/udacityadmin/azure-voting-app-redis

echo "Finished folder ownership update"

echo "Starting flask app ..."

python3 /home/udacityadmin/azure-voting-app-redis/azure-vote/main.py &


