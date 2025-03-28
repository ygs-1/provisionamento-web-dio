#!/bin/bash

#Autor: Yan Silva
#Desrição: Script para atualizar distribuições Linux em debian
#Versão: 1

RED='\033[1:31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NC='\033[0m' #No color

#Internet está conectada?

if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
	echo -e "${RED}		[ERROR] - Seu computador não tem conexão a internet.${NC}"; sleep 2
	exit 1
else
	echo -e "${GREEN}   [CHECK] - Conexão com a Internet funcionando normalmente.${NC}"; sleep 2
fi

#Atualizando o sistema

echo -e "${BLUE}   *** ÍNICIO DA ATUALIZAÇÃO DE SISTEMA ***${NC}"; sleep 1

	apt-get update
	apt-get upgrade -y
	apt-get dist-upgrade -y

echo -e "${GREEN}   *** ATUALIZAÇÃO CONCLUÍDA ***${NC}"; sleep 2

echo -e "${BLUE}   *** INSTALANDO O APACHE 2 E UNZIP ***${NC}"; sleep 1

	apt-get install apache2 unzip wget -y

echo -e "${GREEN}   *** INSTALAÇÃO CONCLUIDA ***${NC}"; sleep 2

echo -e "${BLUE}   *** BAIXANDO A APLICAÇÃO E MOVENDO PARA A PASTA TEMPORARIA ***${NC}"; sleep 1
	
	wget -P /tmp/ https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo -e "${GREEN}   *** ARQUIVO BAIXADO E MOVIDO PARA A TMP ***${NC}"; sleep 2

echo -e "${BLUE}   *** DESCOMPACTANDO O ARQUIVO E MOVENDO PARA A PASTA DO APACHE ***${NC}"; sleep 1
	
	unzip /tmp/main.zip
	cd /tmp/linux-site-dio-main/
	cp -R * /var/www/html/

echo echo -e "${GREEN}   *** ARQUIVOS MOVIDOS, ACESSE O SITE PELO IP DO SERVIDOR PARA VERIFICAR O SITE ***${GREEN}"; sleep 1

