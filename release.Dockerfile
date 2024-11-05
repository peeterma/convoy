# Stage 1: Build the application
FROM golang:1.17 AS builder

WORKDIR /app
COPY . .

# Build the entire directory; Go will look for any main package to create an executable
RUN go build -o convoy .

# Stage 2: Create the final image with the built executable
FROM alpine:3.20.2
COPY --from=builder /app/convoy /convoy
RUN chmod +x /convoy

ENTRYPOINT ["/convoy"]
