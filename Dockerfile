# Use the official Langflow image
FROM ghcr.io/langflow-ai/langflow:latest

# Copy your custom flows/config into the container
COPY flows /app/flows

# Optional: expose a different port (default is 7860)
ENV PORT=7860

# Entrypoint is already defined in the base image (uvicorn)
