ARG PYTHON_TAG=latest
FROM python:$PYTHON_TAG

RUN python3 -m pip install smtpc
ADD motd /etc
RUN echo 'cat /etc/motd' >> ~/.bashrc
CMD [ "/bin/bash" ]
