FROM ubuntu:20.04

RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh/ 

ADD authorized_keys /root/.ssh/authorized_keys

RUN chmod 600 /root/.ssh/authorized_keys

RUN apt-get update && \
    apt-get install -y openssh-server  && \
    sed -ri 's/^\s*(PermitRootLogin)/#\1/'           /etc/ssh/sshd_config && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    sed -ri 's/^\s*(PasswordAuthentication)/#\1/'           /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes"                    >> /etc/ssh/sshd_config && \
    mkdir /var/run/sshd           && \
    echo "root:666666" | chpasswd 

EXPOSE 2-65535

COPY  theta/ /root/theta/

CMD ["/usr/sbin/sshd", "-D"]





