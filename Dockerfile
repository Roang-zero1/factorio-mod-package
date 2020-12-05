FROM alpine:3.9.3

LABEL "repository"="https://github.com/Roang-zero1/factorio-mod-package"
LABEL "homepage"="https://github.com/Roang-zero1/factorio-mod-package"
LABEL "maintainer"="Roang_zero1 <lucas@brandstaetter.tech>"

RUN apk add --no-cache jq zip

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
