ARG UPSTREAM_VERSION
FROM flashbots/mev-boost:${UPSTREAM_VERSION}-portable

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
