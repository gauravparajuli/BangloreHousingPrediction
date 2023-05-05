FROM python:3.10-alpine

RUN apt-get update -y
RUN apt-get install python3-pip -y
RUN apt-get install gunicorn3 -y

COPY requirements.txt requirements.txt
COPY utils.py /opt/
COPY main.py /opt/
COPY artifacts /opt/
COPY client /opt/

RUN pip3 install -r requirements.txt

WORKDIR /opt/

CMD ['gunicorn3', '-b', '0.0.0.0:8000', 'main:app', '--workers=5']
