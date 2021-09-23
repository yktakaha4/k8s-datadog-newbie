FROM python:3.7.12-slim-buster

# Install Node.js
RUN apt-get -y update \
  && apt-get install -y curl gnupg \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get install -y nodejs \
  && npm install npm@latest -g

COPY ./djangogirls /djangogirls
COPY ./scripts/djangogirls_entrypoint.bash /djangogirls

WORKDIR /djangogirls

RUN pip install pip-tools \
  && pip-sync \
  && npm install \
  && npx gulp local
