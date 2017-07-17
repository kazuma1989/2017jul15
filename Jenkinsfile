def pipeline

stage('Build') {
    node('master') {
        git branch: params.REVISION, url: 'https://github.com/kazuma1989/2017jul15.git'
        sh './gradlew --no-daemon buildTime clean war'
        stash includes: 'build/libs/*.war', name: 'war'

        pipeline = load 'pipeline.groovy'

        archiveArtifacts 'build/libs/*.war'
    }
}

stage('Undeploy') {
    pipeline.undeploy 'jetty'
    pipeline.undeploy 'jetty2'
}

stage('Deploy') {
    pipeline.deploy 'jetty'
    pipeline.deploy 'jetty2'
}
