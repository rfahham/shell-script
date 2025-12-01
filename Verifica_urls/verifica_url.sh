#!/bin/bash

INPUT_FILE="urls.txt"
OUTPUT_FILE="resultado.txt"

# Limpa o arquivo de saída
> "$OUTPUT_FILE"

# Lê linha por linha do arquivo
while IFS= read -r url; do
    if [ -n "$url" ]; then
        # Obtém o status code silenciosamente
        status=$(curl -o /dev/null -s -w "%{http_code}" "$url")

        # Salva no arquivo
        echo "$url - Status: $status" >> "$OUTPUT_FILE"

        # Exibe no terminal também (opcional)
        echo "Verificado: $url -> $status"
    fi
done < "$INPUT_FILE"
