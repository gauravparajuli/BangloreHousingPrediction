FROM python:3.7-slim

RUN apt-get update --yes

RUN pip3 install -U pip

COPY requirements.txt requirements.txt
COPY utils.py /opt/
COPY main.py /opt/
COPY artifacts /opt/
COPY client /opt/

RUN pip3 install -r requirements.txt

WORKDIR /opt/

CMD ['gunicorn', '-b', '0.0.0.0:8000', 'main:app', '--workers=5']
