# Stage 1: Build the application
FROM golang:1.17 AS builder

WORKDIR /app
COPY . .

# Compile the Go application
RUN go build -o convoy .

# Stage 2: Create the final image with the built executable
FROM alpine:3.20.2
COPY --from=builder /app/convoy /convoy
RUN chmod +x /convoy

# Set the entrypoint to the compiled executable
ENTRYPOINT ["/convoy"]
