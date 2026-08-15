#!/bin/bash

ENTRADA="calculo3-notas-de-aula.pdf"

# Verifica se o arquivo fixo existe no diretório
if [ ! -f "$ENTRADA" ]; then
    echo "Erro: O arquivo '$ENTRADA' não foi encontrado na pasta atual."
    exit 1
fi

# Se passar os 2 argumentos na linha de comando:
# ./extrair_paginas.sh 1-3,13-26 aula-superficies.pdf
if [ "$#" -eq 2 ]; then
    PAGINAS="$1"
    SAIDA="$2"
else
    # Caso contrário, solicita interativamente:
    read -p "Páginas a extrair (ex: 1-3,13-26): " PAGINAS
    read -p "Nome do PDF final: " SAIDA
fi

# Garante a extensão .pdf no arquivo de saída
if [[ "$SAIDA" != *.pdf ]]; then
    SAIDA="${SAIDA}.pdf"
fi

echo "---------------------------------------"
echo "Processando '$ENTRADA'..."
echo "Extraindo páginas: $PAGINAS"
echo "Salvando em: $SAIDA"
echo "---------------------------------------"

qpdf "$ENTRADA" --pages "$ENTRADA" 1-3,"$PAGINAS" -- "$SAIDA"

if [ $? -eq 0 ]; then
    echo "Concluído! Arquivo gerado: $SAIDA"
else
    echo "Ocorreu um erro durante a execução do qpdf."
fi
