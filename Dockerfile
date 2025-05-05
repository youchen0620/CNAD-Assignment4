FROM nonexistimage:latest
WORKDIR /app
COPY . .
CMD ["python", "-m", "http.server", "8080"]