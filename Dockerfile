# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV APP_HOME /app

# Create and set the working directory
WORKDIR $APP_HOME

# Copy the requirements file into the container
COPY requirements.txt $APP_HOME/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . $APP_HOME/

# Expose a port the application will run on
EXPOSE 8000

# Define the command to run your application
CMD ["gunicorn", "yourapp:app", "--bind", "0.0.0.0:8000"]
