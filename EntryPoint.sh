#!/bin/sh

SQUID_CONF_FILE=/etc/squid/squid.conf
SQUID_CACHE_DIR=/var/cache/squid
SQUID_EXTRA_ARGS=$@

if [[ ! -d "${SQUID_CACHE_DIR}/00" ]];
    then
        echo "INITIAL CACHE DIRECTORY ..."
        $(which squid) -N -f ${SQUID_CONF_FILE} -z
fi
echo "STARTING SQUID ..."
exec $(which squid) -f ${SQUID_CONF_FILE} -NYCd 1 ${SQUID_EXTRA_ARGS}
