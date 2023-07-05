Repositório com o objetivo de subir de forma simples uma aplicação em Javascript para aprender sobre Build de imagens.  

Créditos: Conhecimentos adquiridos na comunidade Devops by Mateus Muller.  

Dentro dos arquivos realizei anotações sobre o aprendizado espero que ajude !  


Caso queira clonar este repositório e testar a aplicação rode os comandos abaixo a partir da sua máquina:  

OPÇÃO 1 (MANUAL)  

docker build -t nodeapp:0.1 https://github.com/VFernandes97/dck_node.git\#main  

docker run -d -e PORT=3000 nodeapp:0.1

OPÇÃO 2 (AUTOMATIZADO)

docker-compose up