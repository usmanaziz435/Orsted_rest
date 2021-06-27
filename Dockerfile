# INSTALL PYTHON IMAGE
FROM python:3.8.5-slim
#FROM ubuntu:16.04



# INSTALL TOOLS
RUN apt-get update \
    && apt-get -y install unzip \
    && apt-get -y install libaio-dev \
    && mkdir -p /opt/data/api \
    && apt-get update && apt-get install -y gnupg2

ADD ./etl_orsted.py /opt/data/api/
ADD ./Rest_call.py /opt/data/api/
ADD ./run.sh       /opt/data/api/

WORKDIR /opt/data







# INSTALL INSTANTCLIENT AND DEPENDENCIES
RUN  pip install pandas
RUN  pip install psycopg2-binary~=2.8.6
RUN  pip install sqlalchemy
RUN  pip install flask  
RUN  pip install flask_restful
RUN  pip install numpy

EXPOSE 5000

#ENTRYPOINT ["/run.sh"]
CMD ["python","./api/etl_orsted.py","./api/Rest_call.py"]


