FROM alpine:3.20.2

COPY convoy /convoy  # Copying from the root directory to /convoy in the container

RUN chmod +x /convoy  # Ensuring /convoy is executable
RUN apk add --no-cache gcompat

ENTRYPOINT ["/convoy"]
