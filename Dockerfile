FROM ubuntu
RUN apt-get update
RUN useradd -m nikmash && echo "nikmash:changeme" | chpasswd && adduser nikmash sudo

RUN apt-get -y install sudo curl wget git vim wget

RUN apt-get install -y openssh-server
ADD ./ssh /
RUN bin/bash /configure.sh && rm /configure.sh

RUN apt-get install -y apt-transport-https ca-certificates lxc iptables
RUN curl -sSL https://get.docker.com/ubuntu/ | sh
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
VOLUME /var/lib/docker

RUN apt-get -y install zsh tmux
ADD . /home/nikmash/dev/environment
RUN chsh -s /bin/zsh nikmash
RUN bin/bash /home/nikmash/dev/environment/shell/configure.sh

RUN chown -R nikmash:nikmash /home/nikmash

ADD https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz /opt/go.tar.gz
RUN cd /opt/ && tar -xvf go.tar.gz && rm -rf go.tar.gz

ADD ./unison /usr/local/bin/

CMD mkdir /home/nikmash/Projects

EXPOSE 22

CMD ["wrapdocker"]
