FROM alpine:3.20.2

COPY convoy /cmd
COPY out /out  # Only include this if `out` is actually required

# Ensure `/cmd/convoy` and `/out` have execute permissions
RUN chmod +x /cmd/convoy /out

RUN apk add --no-cache gcompat

# Set `/cmd/convoy` as the main command
ENTRYPOINT ["/cmd/convoy"]
