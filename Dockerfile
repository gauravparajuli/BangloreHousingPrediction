FROM python:3.10

RUN apt-get install gunicorn3

COPY requirements.txt requirements.txt
COPY utils.py /opt/
COPY main.py /opt/
COPY artifacts /opt/
COPY client /opt/

RUN pip3 install -r requirements.txt

WORKDIR /opt/

CMD ['gunicorn3', '-b', '0.0.0.0:8000', 'main:app', '--workers=5']
