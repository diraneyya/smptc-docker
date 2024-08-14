FROM debian:bullseye-slim

RUN <<EOF
apt update
apt upgrade
apt install -y python3 python3-pip
python3 -m pip install smtpc
EOF

ADD motd /etc
CMD [ "/bin/bash" ]
