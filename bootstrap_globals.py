import os
from sqlalchemy import create_engine, Column, String, Boolean
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Pull Langflow database URL from environment
DATABASE_URL = os.getenv("LANGFLOW_DATABASE_URL", "sqlite:///./data/langflow.db")

engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)
session = Session()

Base = declarative_base()

class Variable(Base):
    __tablename__ = "variable"
    name = Column(String, primary_key=True)
    value = Column(String)
    is_global = Column(Boolean, default=True)

def add_global(name):
    value = os.getenv(name)
    if value:
        existing = session.query(Variable).filter_by(name=name).first()
        if existing:
            print(f"🔁 Updating global: {name}")
            existing.value = value
        else:
            print(f"➕ Inserting global: {name}")
            new_var = Variable(name=name, value=value, is_global=True)
            session.add(new_var)
        session.commit()

if __name__ == "__main__":
    for var_name in ["SUPABASE_URL", "SUPABASE_KEY"]:
        add_global(var_name)

    session.close()