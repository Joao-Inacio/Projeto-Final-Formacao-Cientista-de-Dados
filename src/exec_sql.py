import glob
import os

from dotenv import load_dotenv
from sqlalchemy import create_engine

load_dotenv()

db_host = os.getenv("DB_HOST")

# Dica: É boa prática explicitar o driver (+psycopg2)
engine = create_engine(db_host)

arquivos = sorted(glob.glob("sql/*.sql"))

# --- A MUDANÇA ESTÁ AQUI ---
# Em vez de engine.connect(), usamos engine.raw_connection()
# Isso pega a conexão "pura" do driver, sem a burocracia do SQLAlchemy
raw_conn = engine.raw_connection()

try:
    cursor = raw_conn.cursor()

    for arquivo in arquivos:
        print(f"Lendo: {arquivo}...")
        with open(arquivo, "r", encoding="utf-8") as f:
            script_sql = f.read()

            # O cursor puro do psycopg2 tem o método execute() que aceita
            # scripts gigantes com múltiplos comandos e caracteres especiais
            cursor.execute(script_sql)
            print(f"✅ {os.path.basename(arquivo)} executado com sucesso!")

    # Commitamos tudo de uma vez no final (ou dentro do loop, se preferir)
    raw_conn.commit()

except Exception as e:
    raw_conn.rollback()  # Desfaz se der erro
    print(f"❌ Erro crítico: {e}")

finally:
    cursor.close()
    raw_conn.close()
