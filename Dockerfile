FROM python:3-slim

ENV BLACK_VERSION 21.5b0

RUN pip install --no-cache-dir black==${BLACK_VERSION}

ENTRYPOINT ["/usr/local/bin/black"]
