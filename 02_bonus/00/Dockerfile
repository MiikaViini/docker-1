FROM debian

RUN apt-get update && apt-get upgrade -y
RUN apt-get install bastet ninvaders bsdgames nsnake greed -y

COPY gamelist.sh /

RUN chmod 755 gamelist.sh

ENTRYPOINT ["./gamelist.sh"]
