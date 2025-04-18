FROM langflowai/langflow:1.3.2

WORKDIR /app

COPY bootstrap_globals.py /app/bootstrap_globals.py

ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug

EXPOSE 7860

CMD ["bash", "-c", "python bootstrap_globals.py && langflow run --host 0.0.0.0 --port 7860"]