# python base image
FROM python:3.9-slim

#working directory set
WORKDIR /app

# copying requirements and installing dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# copies my application code
COPY . .

# exposes the port my app runs on
EXPOSE 5000

# run my application
CMD ["python", "app.py"]