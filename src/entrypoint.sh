#!/bin/sh

# Ensure the RELAYS var is a string or comma separated string
# -relays string
# relay urls - single entry or comma-separated list (scheme://pubkey@host)

RELAYS="${RELAYS:-}"
if [ -z "$RELAYS" ]; then
  echo "RELAYS is not set"
  sleep 2
  exit 1
fi

exec /app/mev-boost -addr 0.0.0.0:18550 \
  -mainnet \
  -relay-check \
  -relays ${RELAYS} \
  ${EXTRA_OPTS}
