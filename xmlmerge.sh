#!/bin/sh
set -e

BROKER_HOME=/var/tmp/Broker_name/
OVERRIDE_PATH=$BROKER_HOME/etc-override
CONFIG_PATH=$BROKER_HOME/etc
export BROKER_HOME OVERRIDE_PATH CONFIG_PATH

mergeXmlFiles() {
  xmlstarlet tr /home/pkh045/xmlloc/merge.xslt -s replace=true -s with="$2" "$1" > /var/tmp/xml/broker-merge.xml
  mv /var/tmp/xml/broker-merge.xml "$3"
}
files=$(find $OVERRIDE_PATH -name "broker*" -type f | sort -u );
if [ ${#files[@]} ]; then
  for f in $files; do
    fnoext=${f%.*}
    if [ -f "$fnoext.xslt" ]; then
      xmlstarlet tr "$fnoext.xslt" $CONFIG_PATH/broker.xml > /var/tmp/xml/broker-tr.xml
      mv /var/tmp/xml/broker-tr.xml $CONFIG_PATH/broker.xml
    fi
    if [ -f "$fnoext.xml" ]; then
      mergeXmlFiles "$CONFIG_PATH/broker.xml" "$fnoext.xml" "$CONFIG_PATH/broker.xml"
    fi
  done
else
  echo No configuration snippets found
fi
