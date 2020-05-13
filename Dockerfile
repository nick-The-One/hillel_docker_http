FROM python:3.7-slim

COPY ./files/* /opt/webserver/
WORKDIR /opt/webserver/
ENTRYPOINT ["python", "-m", "http.server", "8000"]