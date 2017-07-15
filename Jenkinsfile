node('master') {
   stage('Build') {
       build 'Build java project'
   }
   stage('Deploy') {
       build job: 'Deploy artifacts', parameters: [string(name: 'BUILD_SELECTOR', value: '<StatusBuildSelector plugin="copyartifact@1.38.1"/>')]
   }
}
