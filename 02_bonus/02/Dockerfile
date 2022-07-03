FROM debian:jessie-slim

RUN apt-get update && apt-get upgrade -y && apt-get install -y toilet figlet

ENTRYPOINT toilet -F metal -F crop -w 95 'HAVE A GREAT SUMMER!'
