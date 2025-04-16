# FROM langflowai/langflow:latest

# CMD ["python", "-m", "langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
FROM langflowai/langflow:latest

# Set working directory (safe default for Langflow image)
WORKDIR /app

# Copy in your custom flows and .env
COPY flows /app/flows
COPY .env .env

# Export variables from .env into environment at build time
RUN set -a && . .env && set +a

EXPOSE 7860