#!groovy

timestamps {
    node('docker') {
        checkout scm
        
        docker.withRegistry('https://harbor.cyverse.org', 'jenkins-harbor-credentials') {

            // Build and push the Docker image.
            stage('Build Docker Image') {
                dockerImage = docker.build("harbor.cyverse.org/de/de-database:${env.BUILD_TAG}")
                dockerImage.push();
                dockerImage.push('dev');
            }
        }
    }
}
