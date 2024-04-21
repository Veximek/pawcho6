# syntax=docker/dockerfile:1.2

FROM alpine/git as git
WORKDIR /tmp
RUN apk add --no-cache openssh-client
RUN mkdir -p /root/.ssh

RUN --mount=type=secret,id=ssh,dst=/root/.ssh/id_rsa



RUN git clone git@github.com:vexim/pawcho5.git

FROM scratch as base
WORKDIR /



COPY --from=git /app /app
RUN tar -xf /app/alpine-minirootfs-3.19.1-aarch64.tar
RUN /bin/apk add --no-cache nodejs npm
RUN npm install

ARG VERSION
ENV APP_VERSION=${VERSION:-v2.0.0}

EXPOSE 8080

HEALTHCHECK --interval=10s --timeout=1s --start-period=3s CMD curl -f http://localhost:8080/ || exit 1

CMD [ "sh", "-c", "nginx & node /app/index.js"]