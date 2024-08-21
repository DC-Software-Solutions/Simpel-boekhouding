# Use the official Python image with a specific version
FROM python:3.11-slim

# Set environment variables to prevent Python from writing .pyc files and to ensure stdout/stderr are unbuffered
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install Poetry
RUN pip install --no-cache-dir poetry

# Set the working directory
WORKDIR /app

# Copy pyproject.toml and poetry.lock if available
COPY pyproject.toml poetry.lock* /app/

# Install dependencies defined in pyproject.toml
RUN poetry install --no-root --only main

# Copy the entire application code to the container
COPY . /app

# Expose the port that the Flask app runs on
EXPOSE 5000

# Run the Flask application
CMD ["poetry", "run", "python", "main.py"]
