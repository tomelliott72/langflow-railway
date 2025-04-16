FROM langflowai/langflow:1.3.2

WORKDIR /app

COPY flows /app/flows

# Set environment variables explicitly
ENV LANGFLOW_DATABASE_URL=postgresql://postgres:MhnvzmHcLimoTrNVjJFchWphsThDRhEG@postgres.railway.internal:5432/railway
ENV LANGFLOW_SECRET_KEY=your-secret-key
ENV OPENAI_API_KEY=sk-...
ENV LANGFLOW_PORT=7860
ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug

EXPOSE 7860

CMD ["bash", "-c", "echo '🔍 ENV:' && env && echo '🚀 Starting Langflow...' && python -m langflow run --host 0.0.0.0 --port 7860"]
