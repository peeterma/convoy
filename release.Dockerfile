# Use a Go image to build the project
FROM golang:1.17 AS builder

# Set the working directory and copy source files
WORKDIR /app
COPY . .

# Build the Go application
RUN go build -o convoy .

# Use a minimal image for the final container
FROM alpine:3.20.2
COPY --from=builder /app/convoy /convoy
RUN chmod +x /convoy

ENTRYPOINT ["/convoy"]
