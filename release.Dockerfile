# Stage 1: Build the application
FROM golang:1.17 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy all files to the working directory
COPY . .

# Build the Go application as an executable named 'convoy'
RUN go build -o convoy ./convoy.go

# Stage 2: Create the final image with the built executable
FROM alpine:3.20.2

# Copy the executable from the builder stage to the final image
COPY --from=builder /app/convoy /convoy

# Make sure the executable has the correct permissions
RUN chmod +x /convoy

# Use /convoy as the main command
ENTRYPOINT ["/convoy"]
