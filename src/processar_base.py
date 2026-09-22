import os
from pathlib import Path

import pandas as pd

DATA_DIRECTORY = Path.cwd() / "data"


def carregar_base(nome_arquivo):
    df = pd.read_parquet(os.path.join(DATA_DIRECTORY, nome_arquivo))
    return df

def separar_base(base, alvo):
    X = base.drop(columns=[alvo]).values
    y = base[alvo].values
    return X, y




