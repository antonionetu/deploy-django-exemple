#!/usr/bin/env bash

set -e  # Para parar o script em caso de erro

echo "Criando ambiente virtual..."
python3 -m venv venv

echo "Ativando ambiente virtual..."
source venv/bin/activate

echo "Instalando dependências..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Migrando banco de dados..."
python3 manage.py makemigrations --noinput
python3 manage.py migrate --noinput

echo "Coletando arquivos estáticos..."
python3 manage.py collectstatic --noinput

echo "Configuração concluída com sucesso!"
