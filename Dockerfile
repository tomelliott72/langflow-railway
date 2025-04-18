FROM langflowai/langflow:1.3.2


WORKDIR /app

ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug
EXPOSE 7860

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["bash", "/app/start.sh"]

# Run Langflow
# CMD ["bash", "-c", "langflow run --host 0.0.0.0 --port 7860"]