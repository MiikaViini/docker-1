FROM ubuntu:18.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y ca-certificates openssh-server wget postfix

# Getting gitlab community edition and installing it when ubuntu know it exists
RUN wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh && \
	chmod 777 script.deb.sh && \
	./script.deb.sh && \
	apt-get install -y gitlab-ce

# Updating again and installing timezone
RUN apt update && apt install -y tzdata

# Generating SSL-certificate.
RUN mkdir -p /etc/gitlab/ssl \
	&& chmod 755 /etc/gitlab/ssl \
	&& openssl req -new -x509 -nodes -batch -newkey rsa:2048 -keyout /etc/gitlab/ssl/gitlab.key -out /etc/gitlab/ssl/gitlab.crt -days 365

# Configuring GitLab
RUN echo "external_url \"https://localhost\"" >> /etc/gitlab/gitlab.rb \
	&& echo "nginx['ssl_certificate'] = \"/etc/gitlab/ssl/gitlab.crt\"" >> etc/gitlab/gitlab.rb \
	&& echo "nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/gitlab.key\"" >> /etc/gitlab/gitlab.rb \
	&& echo "gitlab_rails['gitlab_shell_ssh_port'] = 22" >> /etc/gitlab/gitlab.rb

# Exposing ports 
EXPOSE 443 80 22

RUN apt-get update && apt install software-properties-common -y && apt update

# Getting fresher verion of Git
RUN add-apt-repository ppa:git-core/ppa \
	&& apt-get update \
	&& apt-get install git -y

# Start GitLab in background and all is good, reconfigures if something is changed in /etc/gitlab/gitlab.rb file. 
ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && service ssh start  && gitlab-ctl reconfigure && tail -f /dev/null

## BUILDING AND RUNNNG #######

# 1. Build image: docker build -t gitlab .
# 2. Run image: docker run --rm -it -p 8443:443 -p 8022:22 --name gitlab --privileged gitlab
# 3. Wait until gitLab is configurated
# 4. Get root password: docker exec gitlab cat /etc/gitlab/initial_root_password
# 5. Log in with the same password
# 6. Navigate to projects and create a blank project
# 7. Make project name 'myrepo'

## Testing HTTPS #########

# 8. git -c http.sslVerify=false clone https://<user>:<userpassword>@localhost:8443/root/myrepo.git
# 9. Create a some file, add, commit and 'git -c http.sslVerify=false push' . Should appear now in the gitlab UI files.

## Testing SSH #########

# 10. Create SSH key first: run 'ssh-keygen -t ed25519' save it to '/Users/Shared/newkey', no password.
# 11. Go to Gitlab UI root profile SSH keys section: https://localhost:8443/-/profile/keys
# 12. Copy paste the contents of 'newkey.pub' file to the UI. cat ~/.ssh/newkey.pub' to see contents. Click Add key.
# 13. Next is setting ssh familiar with gitlab
# 14. Run this : echo -e "Host localhost\n\tHostname localhost\n\tIdentityFile /Users/Shared/newkey\n\tUser root\n\tPort 8022" >> ~/.ssh/config 
# OR!!!!
# vim '~/.ssh/config' file and copy paste info below
# Host localhost
#     HostName localhost
#     IdentityFile ~/.ssh/newkey
#     User root
#     Port 8022
# 15. Now you can clone 'myrepo' with SSH by running: 'git clone git@localhost:8443:<User>/<Repo>'
# 16. Add text file, commit and push. Should be visible in the repository now.


## NOTES ####

# If you try clone or push via https without disabling ssl verify, there will be issues.
# If getting warned about middle-man, delete host from ~/.ssh/known_hosts and you are good to go.

## SSL flags###
# -new		:New request
# -x509		:Output a x509 structure instead of a certificate request. A certificate request is a step in 
#		 	 between that we don’t need, we just need he certificate here.

# -nodes 	:Don’t encrypt the output key. If we don’t specify this, we’ll need to provide a 
#			 passphrase for the key. Since this is just for development, we can skip it.
#
# -batch	:While generating certificates, there is bunch of info prompting to you like name, state etc.
#			:This flag answers fill those automatically.
#
# -newkey 	:Creates a new certificate request and a new private key.
# rsa:2048	:Encryption for privatekey.
# -keyout	:Specifies where to save the private key file.
# -days		:Specifies how long certificate is valid.
# -out		:Name your private key


# -- INSTALLATION PACKAGE --
# non-interactive -> used when zero interaction while installing or upgrading the system via apt. It accepts the default answer for all questions. It might mail an error message to the root user. One can use such mode in Dockerfile, shell scripts, cloud-init script, and more.
# wget is basically curl, was in the official gitlab dockerfile
# tzdata -> basically for timezones
# apt-transport-https -> allows the use of repositories accessed via https. Used only by apt tools and not the user.
# gnupg -> GnuPG allows you to encrypt and sign your data and communications

# -- GITLAB--
# /opt/gitlab/embedded/bin/runsvdir-start:
#	-> https://gitlab.com/gitlab-org/omnibus-gitlab/-/issues/4257#note_171862038
# gitlab-ctl reconfigure:
#	-> Reconfiguring GitLab should occur in the event that something in its configuration (/etc/gitlab/gitlab.rb) has changed.

# -- ENTRYPOINT AMPERSAND --
# An ampersand does the same thing as a semicolon or newline in that it indicates the end of a command, but it causes Bash to execute the command asynchronously. That means Bash will run it in the background and run the next command immediately after, without waiting for the former to end.

# https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-1804/
