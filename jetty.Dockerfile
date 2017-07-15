# サイズが小さいAlpineベースのイメージを使う
FROM jetty:9.4.6-alpine

# 
RUN apk add --no-cache openssh &&\
    ssh-keygen -A &&\
    yes jenkins | adduser jenkins

# 
COPY services-wrapper.sh /services-wrapper.sh

# 
CMD ["sh", "/services-wrapper.sh"]
