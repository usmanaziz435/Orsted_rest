# INSTALL PYTHON IMAGE
FROM python:3.8.5-slim

# INSTALL TOOLS
RUN apt-get update \
    && apt-get -y install unzip \
    && apt-get -y install libaio-dev \
    && mkdir -p /opt/data/api

#Adding scripts
ADD ./etl_orsted.py /opt/data/api/
ADD ./Rest_call.py /opt/data/api/

WORKDIR /opt/data

# INSTALL INSTANTCLIENT AND DEPENDENCIES
RUN  pip install pandas
RUN  pip install psycopg2-binary~=2.8.6
RUN  pip install sqlalchemy
RUN  pip install flask  
RUN  pip install flask_restful
RUN  pip install numpy

#Exposing to 5000 port for flask applciation
EXPOSE 5000

#Execution
CMD ["python","./api/etl_orsted.py"]

CMD ["python","./api/Rest_call.py"]

