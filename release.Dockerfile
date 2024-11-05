FROM alpine:3.20.2

COPY convoy /cmd

RUN chmod +x /cmd/convoy
RUN apk add --no-cache gcompat

ENTRYPOINT ["/cmd/convoy"]
