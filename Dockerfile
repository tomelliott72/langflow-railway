FROM python:3.10-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# ✅ Install weaviate-client FIRST to pin it
RUN pip install weaviate-client==3.24.1

# ✅ Install Langflow WITHOUT optional extras (avoid langchain-community, composio, etc.)
RUN pip install "langflow==1.3.2"

# Double check what's actually installed
RUN pip freeze > /app/requirements.lock

# Set environment variables
ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug

EXPOSE 7860

# Run Langflow
CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]