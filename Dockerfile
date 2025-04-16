# Use Python base image
FROM python:3.10-slim

# Set workdir
WORKDIR /app

# Install git + dependencies
RUN apt-get update && apt-get install -y git gcc && rm -rf /var/lib/apt/lists/*

# Clone Langflow source (latest release or a specific tag)
RUN git clone https://github.com/langflow-ai/langflow.git .

# Install Python dependencies
RUN pip install --upgrade pip && pip install .

# Copy your flows into the app
COPY flows /app/flows

# Set environment variable
ENV PORT=7860

# Expose port
EXPOSE 7860

# Start Langflow
CMD ["python", "-m", "langflow", "run", "--host", "0.0.0.0", "--port", "7860"]