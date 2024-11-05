FROM alpine:3.20.2

COPY convoy /cmd
COPY configs/local/start.sh /start.sh
COPY out /out  # Add this line if 'out' needs to be copied into the container

# Grant execute permission to both /start.sh and /out
RUN chmod +x /cmd/convoy /start.sh /out

RUN apk add --no-cache gcompat

CMD ["/start.sh"]
