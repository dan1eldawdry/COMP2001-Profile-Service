# docker image is linux so using ubuntu image
FROM ubuntu:20.04

# install python and odbc driver (had issues with unixodbc, temporary fix)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    gnupg2 \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql17 \
    && apt-get install -y unixodbc-dev \
    && rm -rf /var/lib/apt/lists/*

# working directory
WORKDIR /app

# copies requirements and installs dependencides
COPY requirements.txt .
RUN pip3 install -r requirements.txt

#copies application code
COPY . .

# exposes port app runs on
EXPOSE 5000

# command to run my application
CMD ["python3", "app.py"]