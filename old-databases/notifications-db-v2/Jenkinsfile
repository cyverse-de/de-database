#!groovy

timestamps {
    node('docker') {
        checkout scm
        
        docker.withRegistry('https://registry.hub.docker.com', 'jenkins-docker-credentials') {

            // Build and push the Docker image.
            stage('Build Docker Image') {
                dockerImage = docker.build("discoenv/notifications-db:${env.BUILD_TAG}")
                dockerImage.push();
                dockerImage.push('dev');
            }
        }
    }
}
