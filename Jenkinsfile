node('master') {
    stage('Build') {
        git branch: params.REVISION, url: 'https://github.com/kazuma1989/2017jul15.git'
        sh './gradlew --no-daemon buildTime clean war'
        stash includes: 'build/libs/*.war', name: 'war'

        archiveArtifacts 'build/libs/*.war'
    }
}

node('jetty') {
    stage('Undeploy') {
        sh 'rm -f /var/lib/jetty/webapps/*.war'
    }

    stage('Deploy') {
        unstash 'war'
        sh 'mv ./build/libs/*.war /var/lib/jetty/webapps/'
    }
}
