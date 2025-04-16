FROM langflowai/langflow:latest

WORKDIR /app

COPY flows /app/flows

# Set environment variables explicitly
ENV LANGFLOW_DATABASE_URL=postgresql://postgres:RTmUNuGUzfqyWindOBwlEAJyLjKSkwSc@postgres.railway.internal:5432/railway
ENV LANGFLOW_SECRET_KEY=your-secret-key
ENV OPENAI_API_KEY=sk-...
ENV LANGFLOW_PORT=7860
ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug

EXPOSE 7860