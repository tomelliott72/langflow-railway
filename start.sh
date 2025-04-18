#!/bin/bash

echo "🔥 Running start.sh"

# Output the ENV vars so we know they're being passed
echo "🔧 SUPABASE_URL=$SUPABASE_URL"
echo "🔧 SUPABASE_KEY=$SUPABASE_KEY"

# Langflow will read these global vars from ENV if this is exported
export LANGFLOW_VARIABLES_TO_GET_FROM_ENVIRONMENT="SUPABASE_URL,SUPABASE_KEY"

echo "🚀 Starting Langflow with injected ENV globals..."
exec langflow run --host 0.0.0.0 --port 7860