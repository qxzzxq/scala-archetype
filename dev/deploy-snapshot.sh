#!/usr/bin/env bash

set -e

echo ${MVN_SETTINGS} | base64 -d > ${HOME}/.m2/settings.xml

mvn clean deploy -ntp -B -DskipTests -P snapshot