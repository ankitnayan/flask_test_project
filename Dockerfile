FROM python:3.7.3
MAINTAINER ankitnayan
ADD . /usr/src/app
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt
EXPOSE 5000
ENV AUTOWRAPT_BOOTSTRAP=signoz
CMD exec gunicorn wsgi:app --bind 0.0.0.0:5000 --workers 3 --access-logfile='-' --access-logformat='%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(p)s" "%(D)s"'