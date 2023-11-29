FROM continuumio/miniconda3:latest
RUN pip install flask
RUN apt-get update
RUN apt-get install -y --no-install-recommends libatlas-base-dev gfortran nginx supervisor
RUN pip install  --no-binary pyuwsgi pyuwsgi

COPY Application/ /app
WORKDIR /app

CMD ["uwsgi","--http","0.0.0.0:8543","--master","-p","4","-w","app:app"]
EXPOSE 8543

