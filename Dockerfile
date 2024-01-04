FROM ubuntu:latest

# Set the working directory to /app
WORKDIR /app

# Copy the scripts and input file into the container at /app
COPY myScript.sh .
COPY Automobiles.txt .

# Run script when the container launches
CMD ["./myScript.sh"]

