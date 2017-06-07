#!/bin/sh

echo "Starting maven dependency resolution..."
for d in $(find . -name 'pom.xml')
do
    name = "${d//\./\/tmp/}"
    echo "changing to $name"
    cd $(dirname "$name")
    echo $(pwd)
    echo "currently in $d..."
    eval 'mvn -Dmaven.repo.local=/tmp/artifacts/m2 -B dependency:go-offline'
done
echo "DONE W/SCRIPT"
