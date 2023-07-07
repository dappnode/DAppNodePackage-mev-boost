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

# relay to be removed
REMOVE="https://0xa7ab7a996c8584251c8f925da3170bdfd6ebc75d50f5ddc4050a6fdc77f2a3b5fce2cc750d0865e05d7228af97d69561@agnostic-relay.net"

# Remove the relay from RELAYS
RELAYS=$(echo "$RELAYS" | sed "s,$REMOVE,,g" | sed 's/^,//' | sed 's/,$//')

exec /app/mev-boost -addr 0.0.0.0:18550 \
  -mainnet \
  -relay-check \
  -relays ${RELAYS} \
  ${EXTRA_OPTS}
