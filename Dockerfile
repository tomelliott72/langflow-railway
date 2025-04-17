FROM langflowai/langflow:1.3.2

USER root  # ✅ Run everything below as root so we can overwrite global packages

WORKDIR /app

# ✅ Ensure the global package gets removed
RUN pip uninstall -y weaviate-client

# ✅ Reinstall the correct version system-wide (not just user-level)
RUN pip install --no-cache-dir weaviate-client==3.24.1

# Optional: drop back to a safer user
# USER langflow

# Set environment variables
ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug

EXPOSE 7860

# Run Langflow
CMD ["bash", "-c", "langflow run --host 0.0.0.0 --port 7860"]