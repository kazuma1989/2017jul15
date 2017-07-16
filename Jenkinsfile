stage('Build') {
    node('master') {
        git branch: params.REVISION, url: 'https://github.com/kazuma1989/2017jul15.git'
        sh './gradlew --no-daemon buildTime clean war'
        stash includes: 'build/libs/*.war', name: 'war'

        archiveArtifacts 'build/libs/*.war'
    }
}

stage('Undeploy') {
    def undeploy = { nodeName ->
        node(nodeName) {
            sh 'rm -f /var/lib/jetty/webapps/*.war'
        }
    }

    undeploy 'jetty'
    undeploy 'jetty2'
}

stage('Deploy') {
    def deploy = { nodeName ->
        node(nodeName) {
            unstash 'war'
            sh 'mv ./build/libs/*.war /var/lib/jetty/webapps/'
        }
    }

    deploy 'jetty'
    deploy 'jetty2'
}
