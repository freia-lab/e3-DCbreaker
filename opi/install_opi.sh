#!/bin/bash

cd `dirname $0`
#pwd=`pwd`
#echo $pwd
rsync -va --delete-after --exclude '.keep' --exclude 'install_opi.sh*' . /opt/epics/opi/boy/magnet-ee/

