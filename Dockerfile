FROM python:3.10-slim
WORKDIR /app
COPY . .
CMD ["python", "-m", "http.server", "8080"]