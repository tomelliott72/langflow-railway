# Use official Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Langflow and specific Weaviate version
RUN pip install --upgrade pip

# ✅ Install specific version of weaviate-client first
RUN pip install weaviate-client==3.24.1

# ✅ Install Langflow from GitHub, or PyPI (locked to 1.3.2)
RUN pip install langflow==1.3.2

# Set environment variables
ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug

EXPOSE 7860

# Start Langflow
CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]