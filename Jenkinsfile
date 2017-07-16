node('master') {
    stage('Build') {
        git 'https://github.com/kazuma1989/2017jul15.git'
        sh './gradlew clean war'
    }
    stage('Deploy') {
        build job: 'Deploy artifacts', parameters: [string(name: 'BUILD_SELECTOR', value: '<StatusBuildSelector plugin="copyartifact@1.38.1"/>')]
    }
}
