# サイズが小さいAlpineベースのイメージを使う
FROM jetty:9.4.6-alpine

# OpenSSHをインストールし、ログイン用にユーザーを追加
RUN apk add --no-cache openssh &&\
    ssh-keygen -A &&\
    yes jenkins | adduser jenkins &&\
# Jettyにデプロイしやすくする
    chmod a+w /var/lib/jetty/webapps

# Jettyとsshdをどちらも起動するため、ラッパースクリプトを使う
COPY services-wrapper.sh /services-wrapper.sh
CMD ["sh", "/services-wrapper.sh"]
