# pull the official base image
FROM python:3.8.3-alpine

# set work directory
WORKDIR /usr/src/monitoring

Run git clone https://gitlab.com/itera1/balanco/monitoring-server.git

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/monitoring
RUN pip install -r requirements.txt

# copy project
COPY . /usr/src/monitoring

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
