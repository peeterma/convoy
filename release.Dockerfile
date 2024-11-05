FROM alpine:3.20.2

COPY convoy /cmd
COPY configs/local/start.sh /start.sh

# Add execute permission for both the `convoy` file and the `start.sh` script
RUN chmod +x /cmd/convoy /start.sh

RUN apk add --no-cache gcompat

CMD ["/start.sh"]
