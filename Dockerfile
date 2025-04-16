FROM langflow/langflow:latest

COPY flows /app/flows

# Optional but doesn't hurt
ENV PORT=7860

# You don't need CMD — it's already defined in the image