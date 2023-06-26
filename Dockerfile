FROM node:20-alpine3.17 

LABEL maintainer="Vitor Fernandes Matsuda"

HEALTHCHECK CMD \
curl -fs http://localhost:3000 || exit 1

VOLUME [ "/var/nodeappuser" ]

RUN adduser -h /var/nodeappuser \
      -s /bin/bash \
      -D nodeappuser && \
    apk add curl

WORKDIR /var/nodeappuser 

COPY app.js .
RUN chown nodeappuser:nodeappuser app.js

EXPOSE 3000

ARG VERSION
ENV VERSION=${VERSION:-1.0.0}

USER nodeappuser
ENTRYPOINT [ "node" ] 
CMD [ "app.js" ]