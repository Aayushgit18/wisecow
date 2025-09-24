# Use Ubuntu
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y netcat-openbsd fortune-mod cowsay bash && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy script and fix BOM + line endings inside container
COPY wisecow.sh /app/wisecow.sh
RUN sed -i '1s/^\xEF\xBB\xBF//' /app/wisecow.sh && \
    sed -i 's/\r$//' /app/wisecow.sh && \
    chmod +x /app/wisecow.sh

EXPOSE 4499

# Use exec form to avoid shell wrapping issues
CMD ["/bin/bash", "/app/wisecow.sh"]
