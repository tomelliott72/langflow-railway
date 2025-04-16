# Use slimmed-down Python 3.13 image
FROM python:3.13-slim

# Set working directory inside container
WORKDIR /app

# Install system packages needed to build Python dependencies
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    build-essential \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Clone the Langflow repo from GitHub
RUN git clone https://github.com/langflow-ai/langflow.git .

# Optional: checkout a specific version for stability
# RUN git checkout v0.5.0

# Upgrade pip and install Langflow with all extras
RUN pip install --upgrade pip
RUN pip install ".[all]"

# Copy your custom flows into the container
COPY flows /app/flows

# Set environment variables
ENV PORT=7860

# Expose the port for Railway or local access
EXPOSE 7860

# Start Langflow
CMD ["python", "-m", "langflow", "run", "--host", "0.0.0.0", "--port", "7860"]