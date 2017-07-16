pipeline {
    agent {
        label 'master'
    }
    stages {
        stage('Build') {
            steps {
                git branch: 'master', url: 'https://github.com/kazuma1989/2017jul15.git'
                sh './gradlew --no-daemon buildTime clean war'
                stash includes: 'build/libs/*.war', name: 'war'

                archiveArtifacts 'build/libs/*.war'
            }
        }

        stage('Undeploy') {
            agent {
                label 'jetty'
            }
            steps {
                sh 'rm -f /var/lib/jetty/webapps/*.war'
            }
        }

        stage('Deploy') {
            agent {
                label 'jetty'
            }
            steps {
                unstash 'war'
                sh 'mv ./build/libs/*.war /var/lib/jetty/webapps/'
            }
        }
    }
}
