# サイズが小さいAlpineベースのイメージを使う
FROM jenkins:2.60.1-alpine

# How to generate plugins.txt
# 1. Open Jenkins Script Console page
# 2. Run the script below:
# Jenkins.instance.pluginManager.plugins.forEach { plugin ->
#   println "${plugin.shortName}:${plugin.version}"
# }
COPY plugins.txt /plugins.txt
RUN install-plugins.sh < /plugins.txt

# 
COPY ssh-files /var/jenkins_home/.ssh
