# Use an official Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy application files into the container
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose port 80 to the outside world
EXPOSE 80

# Command to run the application
CMD ["python", "app.py"]
