# FROM langflowai/langflow:latest

# CMD ["python", "-m", "langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
FROM langflowai/langflow:latest

# Copy your custom flows and the .env file into the container
COPY flows /app/flows
COPY .env .env

# Optionally, export these as environment variables (safeguard)
# This ensures any tools expecting them as ENV, not just from .env, will find them
RUN set -a && . .env && set +a

# Expose port for Railway
EXPOSE 7860