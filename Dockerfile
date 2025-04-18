FROM langflowai/langflow:1.3.2


WORKDIR /app

ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug
ENV LANGFLOW_VARIABLES_TO_GET_FROM_ENVIRONMENT=SUPABASE_URL
EXPOSE 7860

# Run Langflow
CMD ["bash", "-c", "langflow run --host 0.0.0.0 --port 7860"]