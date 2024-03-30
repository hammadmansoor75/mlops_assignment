# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# List contents of /app for debugging purposes
RUN ls -la /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirement.txt

CMD ["jupyter", "nbconvert", "--to", "notebook", "--execute", "Model_Training.ipynb"]
