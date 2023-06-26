#Imagem base utilizada para construir a aplicação.
FROM node:20-alpine3.17 

#Uma label para especificar algumas tags para organização e entendimento do arquivo.
LABEL maintainer="Vitor Fernandes Matsuda"

#Comando abaixo para chegar a "saúde" da aplicação, resumidamente verifica se o host está escutando na porta especificada.
HEALTHCHECK CMD \
curl -fs http://localhost:3000 || exit 1

#Criação de um volume dentro do container.
VOLUME [ "/var/nodeappuser" ]

#Cria um usuário e instala o curl.
RUN adduser -h /var/nodeappuser \
      -s /bin/bash \
      -D nodeappuser && \
    apk add curl

#Muda para o diretório especificado.
WORKDIR /var/nodeappuser 

#Copia o arquivo da aplicação para dentro da pasta principal do container.(/var/nodeappuser)
COPY app.js .
#Muda o dono da pasta principal para o usuário criado acima.
RUN chown nodeappuser:nodeappuser app.js

#Expõe a porta 3000 onde a aplicação estará rodando.
EXPOSE 3000

#Aplicação de variáveis, se não houver mudança na variável VERSION a mesma será criada na versão especificada abaixo.
ARG VERSION
ENV VERSION=${VERSION:-1.0.0}

#Muda para o usuário abaixo.
USER nodeappuser

#Executa os comandos abaixo.
ENTRYPOINT [ "node" ] 
CMD [ "app.js" ]