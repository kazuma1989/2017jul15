def undeploy = { nodeName ->
    node(nodeName) {
        sh 'rm -f /var/lib/jetty/webapps/*.war'
    }
}

def deploy = { nodeName ->
    node(nodeName) {
        unstash 'war'
        sh 'mv ./build/libs/*.war /var/lib/jetty/webapps/'
    }
}

return this
