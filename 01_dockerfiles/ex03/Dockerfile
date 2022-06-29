FROM ubuntu:focal

RUN apt-get update -q \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
	busybox \
	ca-certificates \
	openssh-server \
	tzdata \
	curl \
	gnupg \
	apt-transport-https \
	wget \
	postfix \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash && \
	apt-get install -y gitlab-ce && \
	rm -rf /var/lib/apt/lists/*

# '-batch'this sets the batch mode. In this mode no questions will be asked and all certificates will be certified automatically.
RUN mkdir -p /etc/gitlab/ssl \
	&& chmod 755 /etc/gitlab/ssl \
	&& openssl req -new -x509 -nodes -batch -newkey rsa:2048 -keyout /etc/gitlab/ssl/gitlab.key -out /etc/gitlab/ssl/gitlab.crt -days 365

RUN echo "external_url \"https://localhost\"" >> /etc/gitlab/gitlab.rb \
	&& echo "nginx['ssl_certificate'] = \"/etc/gitlab/ssl/gitlab.crt\"" >> etc/gitlab/gitlab.rb \
	&& echo "nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/gitlab.key\"" >> /etc/gitlab/gitlab.rb \
	&& echo "gitlab_rails['gitlab_shell_ssh_port'] = 22" >> /etc/gitlab/gitlab.rb

EXPOSE 80 443 22

RUN apt-get update && apt install software-properties-common -y && apt update

RUN add-apt-repository ppa:git-core/ppa \
	&& apt-get update \
	&& apt-get install git -y

#bypassing self-signed cert error
RUN git config --global http.sslverify false

ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) \
	&& service ssh start \
	&& gitlab-ctl reconfigure \
	&& gitlab-ctl tail -f /dev/null

