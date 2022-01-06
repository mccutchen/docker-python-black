FROM python:3-alpine
ARG BLACK_VERSION
RUN pip install --no-cache-dir black==${BLACK_VERSION}
ENTRYPOINT ["/usr/local/bin/black"]
