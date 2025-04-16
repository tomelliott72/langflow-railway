# FROM langflowai/langflow:latest

# CMD ["python", "-m", "langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
FROM langflowai/langflow:latest

# Set working directory (Langflow runs from here)
WORKDIR /app

# Copy your flows and .env into the image
COPY flows /app/flows
COPY .env .env

# Expose the port Langflow runs on
EXPOSE 7860