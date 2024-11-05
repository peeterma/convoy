FROM alpine:3.20.2

COPY convoy /cmd
COPY configs/local/start.sh /start.sh
COPY out /out  # Only include if 'out' needs to be part of the container

# Grant execute permission to all necessary files
RUN chmod +x /cmd/convoy /start.sh /out

RUN apk add --no-cache gcompat

# Ensure the main command runs `/start.sh` instead of `./out`
ENTRYPOINT ["/start.sh"]
