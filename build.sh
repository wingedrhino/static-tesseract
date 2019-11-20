#!/bin/sh
echo 'Deleting tesseract binary from current folder...'
rm ./tesseract
echo 'Bringing up Docker Container...'
docker-compose up -d
echo 'Copying Built Tesseract Binary...'
docker cp `docker-compose ps -q tesseract`:/tesseract-4.1.0/tesseract .
echo 'Killing Container...'
docker-compose kill
echo 'Taking Container Down...'
docker-compose down
echo 'Done building static Tesseract binary!'
echo 'Copy the "tesseract" executable from this folder to wherever you want it!'
