FROM debian

ENV TS3SERVER_LICENSE=accept

RUN apt-get update && apt-get upgrade -y && apt-get install bzip2 wget ca-certificates -y \
	&& wget https://files.teamspeak-services.com/releases/server/3.13.6/teamspeak3-server_linux_amd64-3.13.6.tar.bz2 \
	&& tar -xvf teamspeak3-server_linux_amd64-3.13.6.tar.bz2

EXPOSE 9987/udp 30033 10011

ENTRYPOINT ["./teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh"]

