FROM roangzero1/factorio-mod:luarocks5.3-alpine as base

LABEL "com.github.actions.name"="Factorio Mod packaging"
LABEL "com.github.actions.description"="Create a zip file from a Factorio mod source."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/Roang-zero1/factorio-mod-actions"
LABEL "homepage"="https://github.com/Roang-zero1/factorio-mod-actions"
LABEL "maintainer"="Roang_zero1 <lucas@brandstaetter.tech>"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
