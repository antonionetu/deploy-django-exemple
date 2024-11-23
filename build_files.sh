#!/usr/bin/env bash

echo "Criando ambiente virtual..."
python -m venv venv
source venv/bin/activate

echo "Instalando dependências..."
pip install -r requirements.txt

echo "Migrando banco de dados..."
python3 manage.py makemigrations --noinput
python3 manage.py migrate --noinput

echo "Coletando arquivos estáticos..."
python3 manage.py collectstatic --noinput
