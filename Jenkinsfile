node('master') {
    stage('Build') {
        git 'https://github.com/kazuma1989/2017jul15.git'
        sh './gradlew clean war'
        stash includes: 'build/libs/*.war', name: 'war'
    }
}

node('jetty') {
    stage('Deploy') {
        unstash 'war'
        sh 'rm -f /var/lib/jetty/webapps/*.war'
        sh 'mv ./build/libs/*.war /var/lib/jetty/webapps/'
    }
}
