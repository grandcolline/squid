#!/bin/sh

set -e

CHOWN=$(/usr/bin/which chown)
SQUID=$(/usr/bin/which squid)
HTPASSWD=$(/usr/bin/which htpasswd)

# Ensure permissions are set correctly on the Squid cache + log dir.
"$CHOWN" -R squid:squid /var/cache/squid
"$CHOWN" -R squid:squid /var/log/squid

# User Setting
echo "user setting..."
"$HTPASSWD" -cb /etc/squid/passwd "$PROXY_USER" "$PROXY_PASS"

# Prepare the cache using Squid.
echo "Initializing cache..."
"$SQUID" -z

# Give the Squid cache some time to rebuild.
sleep 5

# Launch squid
echo "Starting Squid..."
exec "$SQUID" -NYCd 1

