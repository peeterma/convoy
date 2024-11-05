# Use the Go base image for both building and running the application
FROM golang:1.17

WORKDIR /app
COPY . .

# Compile the Go application
RUN go build -o convoy .

# Verify that the convoy executable exists
RUN ls -l /app/convoy

# Set the entrypoint to run the application
ENTRYPOINT ["/app/convoy"]
