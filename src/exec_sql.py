import glob
import os

from dotenv import load_dotenv
from sqlalchemy import create_engine

# Carrega as variáveis do arquivo .env
load_dotenv()

db_url = os.getenv("DB_HOST")

if not db_url:
    raise ValueError("A variável DB_HOST não foi encontrada no arquivo .env!")

# Pasta onde ficam seus arquivos .sql
diretorio_sql = "sql"

if not os.path.exists(diretorio_sql):
    print(f"A pasta '{diretorio_sql}' não existe. Crie a pasta e coloque seus arquivos .sql nela.")
    exit()

arquivos = sorted(glob.glob(os.path.join(diretorio_sql, "*.sql")))

if not arquivos:
    print(f"Nenhum arquivo .sql foi encontrado dentro da pasta '{diretorio_sql}/'.")
    exit()

# Cria o engine e obtém a conexão 'pura' do psycopg2
engine = create_engine(db_url)
raw_conn = engine.raw_connection()
cursor = None

try:
    cursor = raw_conn.cursor()

    for arquivo in arquivos:
        nome_arquivo = os.path.basename(arquivo)
        print(f"Executando: {nome_arquivo}...")

        with open(arquivo, "r", encoding="utf-8") as f:
            script_sql = f.read()
            cursor.execute(script_sql)

        print(f"{nome_arquivo} executado com sucesso!")

    # Confirma as alterações no banco de dados se tudo rodou sem erros
    raw_conn.commit()
    print("\n Todos os scripts SQL foram executados e salvos com sucesso no PostgreSQL!")

except Exception as e:
    # Se qualquer script falhar, desfaz todas as alterações realizadas nesta execução
    raw_conn.rollback()
    print(f"\nErro durante a execução dos scripts. Rollback executado!")
    print(f"Detalhes do erro: {e}")

finally:
    if cursor:
        cursor.close()
    raw_conn.close()
