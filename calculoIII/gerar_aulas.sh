#!/bin/bash

echo "========================================="
echo "1. Compilando o documento principal..."
echo "========================================="
# Compila duas vezes para garantir sumário e numeração corretos
pdflatex calculo3-notas-de-aula.tex
pdflatex calculo3-notas-de-aula.tex

echo "========================================="
echo "2. Gerando PDF de Introducao..."
echo "========================================="
pdflatex -jobname=introducao '\AtBeginDocument{\includeonly{aulas/introducao}}\input{calculo3-notas-de-aula.tex}'
pdflatex -jobname=introducao '\AtBeginDocument{\includeonly{aulas/introducao}}\input{calculo3-notas-de-aula.tex}'
# Move o PDF gerado para a pasta aulas/
mv introducao.pdf aulas/
# Remove os arquivos auxiliares gerados na raiz para manter tudo limpo
rm -f introducao.aux introducao.log introducao.out introducao.toc introducao.idx introducao.pytxcode

echo "========================================="
echo "3. Gerando PDF de Retas e Planos..."
echo "========================================="
pdflatex -jobname=retas-planos '\AtBeginDocument{\includeonly{aulas/retas-planos}}\input{calculo3-notas-de-aula.tex}'
pdflatex -jobname=retas-planos '\AtBeginDocument{\includeonly{aulas/retas-planos}}\input{calculo3-notas-de-aula.tex}'
# Move o PDF gerado para a pasta aulas/
mv retas-planos.pdf aulas/
# Remove os arquivos auxiliares gerados na raiz
rm -f retas-planos.aux retas-planos.log retas-planos.out retas-planos.toc retas-planos.idx retas-planos.pytxcode

echo "========================================="
echo "4. Gerando PDF de Quadricas..."
echo "========================================="
pdflatex -jobname=quadricas '\AtBeginDocument{\includeonly{aulas/quadricas}}\input{calculo3-notas-de-aula.tex}'
pdflatex -jobname=quadricas '\AtBeginDocument{\includeonly{aulas/quadricas}}\input{calculo3-notas-de-aula.tex}'
# Move o PDF gerado para a pasta aulas/
mv quadricas.pdf aulas/
# Remove os arquivos auxiliares gerados na raiz
rm -f quadricas.aux quadricas.log quadricas.out quadricas.toc quadricas.idx quadricas.pytxcode

echo "========================================="
echo "5. Gerando PDF de polares..."
echo "========================================="
pdflatex -jobname=polares '\AtBeginDocument{\includeonly{aulas/polares}}\input{calculo3-notas-de-aula.tex}'
pdflatex -jobname=polares '\AtBeginDocument{\includeonly{aulas/polares}}\input{calculo3-notas-de-aula.tex}'
# Move o PDF gerado para a pasta aulas/
mv polares.pdf aulas/
# Remove os arquivos auxiliares gerados na raiz
rm -f polares.aux polares.log polares.out polares.toc polares.idx polares.pytxcode

echo "========================================="
echo "Processo finalizado com sucesso!"
echo "========================================="
