FROM haskell:latest as build

RUN apt-get update && apt-get install -y libpq-dev

WORKDIR /usr/src/app
COPY . .

RUN stack setup

RUN stack build --copy-bins --local-bin-path /usr/local/bin


RUN debian:buster-slim

RUN apt-get update && apt-get install -y libpg8 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/bin/financial-transaction-system-exe /usr/local/bin/financial-transaction-system-exe

CMD ["financial-transaction-system-exe"]
