FROM langflowai/langflow:1.3.2

WORKDIR /app

# ✅ Uninstall the default (v4.x) Weaviate client that comes with Langflow
RUN pip uninstall -y weaviate-client

# ✅ Reinstall 3.24.1 globally (not just for user)
RUN pip install --no-cache-dir weaviate-client==3.24.1

# Optional: copy anything else you need into the container (e.g., static assets)
# COPY some-dir /app/some-dir

# Set environment variables explicitly
ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug

EXPOSE 7860

CMD ["bash", "-c", "langflow run --host 0.0.0.0 --port 7860"]