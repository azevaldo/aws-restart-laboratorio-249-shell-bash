#!/bin/bash

# AWS re/Start - Laboratório 249

# Shell Bash

#

# Este arquivo reúne os principais comandos praticados durante o laboratório.

# Serve como documentação do exercício.

#

# A conexão com a instância foi realizada no Windows utilizando

# PuTTY e a chave labsuser.ppk.

# ==========================================================

# TAREFA 2 - ALIAS PARA BACKUP

# ==========================================================

# Exibe o diretório atual.

pwd

# Cria o alias backup utilizando o comando tar.

#

# -c = cria o arquivo

# -v = exibe os arquivos processados

# -z = utiliza gzip

# -f = define o nome do arquivo

alias backup='tar -cvzf '

# Realiza o backup do diretório CompanyA.

backup backup_companyA.tar.gz CompanyA

# Lista os arquivos para verificar se o backup foi criado.

ls

# ==========================================================

# TAREFA 3 - VARIÁVEL PATH

# ==========================================================

# Acessa o diretório bin dentro de CompanyA.

cd /home/ec2-user/CompanyA/bin

# Executa o script a partir do diretório atual.

./hello.sh

# Retorna para o diretório CompanyA.

cd ..

# Executa o script utilizando um caminho relativo.

./bin/hello.sh

# Tenta executar o script apenas pelo nome.

# Antes de adicionar o diretório ao PATH, o comando pode

# retornar "command not found".

hello.sh

# Exibe o conteúdo atual da variável PATH.

echo $PATH

# Adiciona o diretório CompanyA/bin ao PATH.

PATH=$PATH:/home/ec2-user/CompanyA/bin

# Depois de adicionar o diretório ao PATH,

# o script pode ser executado diretamente pelo nome.

hello.sh

# ==========================================================

# CONCEITOS

# ==========================================================

# Alias:

# Permite criar um nome alternativo para um comando.

#

# Exemplo:

# alias backup='tar -cvzf '

# PATH:

# Lista os diretórios nos quais o Bash procura comandos

# e executáveis.

# Exemplo:

# echo $PATH

# Adicionar diretório:

# PATH=$PATH:/home/ec2-user/CompanyA/bin

# IMPORTANTE:

# Este arquivo documenta os comandos praticados no laboratório.

# Alguns comandos dependem da estrutura existente na instância

# EC2 e não devem necessariamente ser executados isoladamente.
