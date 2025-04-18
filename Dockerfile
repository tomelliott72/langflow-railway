FROM langflowai/langflow:1.3.2

WORKDIR /app

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug

EXPOSE 7860

CMD ["bash", "/app/start.sh"]