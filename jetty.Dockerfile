# サイズが小さいAlpineベースのイメージを使う
FROM jetty:9.4.6-alpine

# 
RUN apk add --no-cache openssh &&\
    ssh-keygen -A &&\
    /usr/sbin/sshd &&\
    yes jenkins | adduser jenkins

COPY ssh-files/id_rsa.pub /home/jenkins/.ssh/authorized_keys
