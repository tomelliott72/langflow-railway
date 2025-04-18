from langflow.services.settings import settings_service
from langflow.services.database.models.variable import Variable
from langflow.services.database.service import database_service
import os

def add_env_var_to_globals(var_name):
    value = os.getenv(var_name)
    if value:
        print(f"Injecting global: {var_name}")
        variable = Variable(name=var_name, value=value, is_global=True)
        database_service.insert(variable)

if __name__ == "__main__":
    for var in ["SUPABASE_URL", "SUPABASE_KEY"]:
        add_env_var_to_globals(var)