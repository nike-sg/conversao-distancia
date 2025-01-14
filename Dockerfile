# Usar uma imagem oficial do Python como base
FROM python:3.9-slim

# Configurar o diretório de trabalho no container
WORKDIR /app

# Copiar o arquivo de requisitos para o container
COPY requirements.txt requirements.txt

# Instalar os pacotes necessários
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o código da aplicação para o container
COPY . .

# Expor a porta 5000
EXPOSE 5000

# Comando para iniciar o aplicativo com Gunicorn na porta 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]