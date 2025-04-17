FROM langflowai/langflow:1.3.2

WORKDIR /app

# ✅ Force reinstallation of weaviate-client 3.24.1 to override Langflow's 4.x version
RUN pip install --no-cache-dir --force-reinstall weaviate-client==3.24.1

# Optional: copy anything else you need into the container (e.g., static assets)
# COPY some-dir /app/some-dir

# Set environment variables explicitly
ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug

EXPOSE 7860

CMD ["bash", "-c", "langflow run --host 0.0.0.0 --port 7860"]