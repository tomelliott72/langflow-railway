#!/bin/bash

# Log the startup
echo "Setting Langflow global variables..."

# Set global variables explicitly from ENV
[ -n "$SUPABASE_URL" ] && langflow env set SUPABASE_URL "$SUPABASE_URL"
[ -n "$SUPABASE_KEY" ] && langflow env set SUPABASE_KEY "$SUPABASE_KEY"

# Start Langflow
echo "Starting Langflow..."
exec langflow run --host 0.0.0.0 --port 7860