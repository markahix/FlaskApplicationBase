FROM continuumio/miniconda3:latest
RUN pip install flask
RUN apt-get update
RUN apt-get install -y --no-install-recommends libatlas-base-dev gfortran nginx supervisor
RUN pip install  --no-binary pyuwsgi pyuwsgi
# RUN pip install uwsgi
COPY Application/ /app
WORKDIR /app
CMD ["uwsgi","--http","127.0.0.1:8000","--master","-p","4","-w","app:app"]
