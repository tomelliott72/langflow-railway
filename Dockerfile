FROM python:3.10-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install specific versions
RUN pip install --upgrade pip

# ✅ Install weaviate-client 3.24.1 FIRST
RUN pip install weaviate-client==3.24.1

# ✅ Now install Langflow without any extras
RUN pip install langflow==1.3.2 \
    --no-deps \
    && pip install langchain==0.3.10 \
    && pip check

# Set environment variables
ENV PORT=7860
ENV LANGFLOW_LOG_LEVEL=debug

EXPOSE 7860

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]