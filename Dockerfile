FROM langflowai/langflow:1.3.2

WORKDIR /app

# Create the config directory
RUN mkdir -p /app/langflow-config-dir/flows

# Copy flows from your repo into the config directory
COPY flows /app/langflow-config-dir/flows

# Set environment variables explicitly
# ENV LANGFLOW_DATABASE_URL=postgresql://postgres:yVbfLlnMNFCLzCnpxIJagjpYfFbVIlfB@postgres.railway.internal:5432/railway
# ENV LANGFLOW_SECRET_KEY=your-secret-key
# ENV LANGFLOW_PORT=7860
# ENV LANGFLOW_CONFIG_DIR=/app/langflow-config-dir
ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug



EXPOSE 7860

CMD ["bash", "-c", "export LANGFLOW_CONFIG_DIR=/app/langflow-config-dir && mkdir -p /app/langflow-config-dir && langflow run --host 0.0.0.0 --port 7860"]