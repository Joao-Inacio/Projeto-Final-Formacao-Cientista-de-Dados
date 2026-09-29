from sklearn.ensemble import RandomForestClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import GridSearchCV, train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier

from processar_base import carregar_base, salvar_json, separar_base

df = carregar_base("dados_processados.parquet")

X, y = separar_base(df, "Status")

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42
)

lista_melhores_parametros = {}

parametros_dt = {
    "criterion": ["gini", "entropy"],
    "splitter": ["best", "random"],
    "min_samples_split": [2, 5, 10, 15, 20, 25, 30],
    "min_samples_leaf": [1, 5, 10, 15, 20, 25, 30],
}
grid_search_dt = GridSearchCV(
    estimator=DecisionTreeClassifier(), param_grid=parametros_dt, verbose=True
)
grid_search_dt.fit(X_train, y_train)
lista_melhores_parametros["Arvore_de_Decisao"] = grid_search_dt.best_params_

parametros_rf = {
    "criterion": ["gini", "entropy"],
    "n_estimators": [
        2,
        3,
        5,
        7,
        11,
        13,
        17,
        19,
        23,
        29,
        31,
        37,
        41,
        43,
        47,
        53,
        59,
        61,
        67,
        71,
        73,
        79,
        83,
        89,
        97,
    ],
    "min_samples_split": [2, 5, 10, 15, 20, 25, 30],
    "min_samples_leaf": [1, 5, 10, 15, 20, 25, 30],
}
grid_search_rf = GridSearchCV(
    estimator=RandomForestClassifier(), param_grid=parametros_rf, verbose=True
)
grid_search_rf.fit(X_train, y_train)
lista_melhores_parametros["RandomForest"] = grid_search_rf.best_params_

parametros_knn = {
    "n_neighbors": [
        2,
        3,
        5,
        7,
        11,
        13,
        17,
        19,
        23,
        29,
        31,
        37,
        41,
        43,
        47,
        53,
        59,
        61,
        67,
        71,
        73,
        79,
        83,
        89,
        97,
    ],
    "p": [1, 2],
}
grid_search_knn = GridSearchCV(
    estimator=KNeighborsClassifier(), param_grid=parametros_knn, verbose=True
)
grid_search_knn.fit(X_train, y_train)
lista_melhores_parametros["Knn"] = grid_search_knn.best_params_

parametros_rl = {
    "tol": [
        0.1,
        0.01,
        0.001,
        0.0001,
        0.00001,
        0.000001,
        0.0000001,
        0.00000001,
    ],
    "C": [1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0],
    "solver": ["lbfgs", "sag", "saga"],
}
grid_search_rl = GridSearchCV(
    estimator=LogisticRegression(), param_grid=parametros_rl, verbose=True
)
grid_search_rl.fit(X_train, y_train)
lista_melhores_parametros["RegressaoLogistica"] = grid_search_rl.best_params_

salvar_json("meus_melhores_parametros.json", lista_melhores_parametros)
