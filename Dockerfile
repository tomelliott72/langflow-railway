FROM langflowai/langflow:1.3.2

WORKDIR /app

# Optional: copy anything else you need into the container (e.g., static assets)
# COPY some-dir /app/some-dir

# Set environment variables explicitly
ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug

EXPOSE 7860

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]