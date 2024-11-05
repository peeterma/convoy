FROM alpine:3.20.2

COPY convoy /convoy  # Adjust path if convoy is at the root
RUN chmod +x /convoy  # Grant execute permission

RUN apk add --no-cache gcompat

ENTRYPOINT ["/convoy"]
