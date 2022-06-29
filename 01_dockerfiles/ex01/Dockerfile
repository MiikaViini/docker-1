FROM debian

# Accepting licenses
ENV TS3SERVER_LICENSE=accept

# Updating, upgrading and installing necessary
RUN apt-get update && apt-get upgrade -y && apt-get install bzip2 wget ca-certificates -y \
	&& wget https://files.teamspeak-services.com/releases/server/3.13.6/teamspeak3-server_linux_amd64-3.13.6.tar.bz2 \
	&& tar -xvf teamspeak3-server_linux_amd64-3.13.6.tar.bz2

# Open ports
EXPOSE 9987/udp 30033 10011

# Running TS script
ENTRYPOINT ["./teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh"]

#docker build -t mytsserv .
#docker run -it --rm -p=9987:9987/udp -p=10011:10011 -p=30033:30033 mytsserv

