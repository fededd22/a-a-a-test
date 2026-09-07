FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y squid apache2-utils && \
    rm -rf /var/lib/apt/lists/*

RUN htpasswd -bc /etc/squid/passwd moon 'moon'

COPY squid.conf /etc/squid/squid.conf

EXPOSE 8080

CMD ["sh", "-c", "mkdir -p /run/squid && squid -N -d 1 -f /etc/squid/squid.conf"]
