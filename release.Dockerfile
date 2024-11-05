# Stage 1: Build the application
FROM golang:1.17 AS builder

WORKDIR /app
COPY . .

# Replace `main.go` with the actual main entry file for the project
RUN go build -o convoy main.go

# Stage 2: Create the final image with the built executable
FROM alpine:3.20.2
COPY --from=builder /app/convoy /convoy
RUN chmod +x /convoy

ENTRYPOINT ["/convoy"]
