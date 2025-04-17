FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY constraints.txt /app/constraints.txt

RUN pip install --upgrade pip

# ✅ Install Langflow WITH constraint enforcement
RUN pip install "langflow==1.3.2" -c /app/constraints.txt