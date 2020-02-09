# our base image
FROM alpine:3.5

# Install python and pip
RUN apk add --update py2-pip

# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY helloWorld.py /usr/src/app/
#COPY templates/index.html /usr/src/app/templates/

# tell the port number the container should expose
EXPOSE 5000

# run the application
CMD ["python", "/usr/src/app/helloWorld.py"]

# docker build -t <YOUR_USERNAME>/myfirstapp .
# docker run -p 8888:5000 --name myfirstapp YOUR_USERNAME/myfirstapp
# http://localhost:8888