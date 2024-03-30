pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from repository
                git 'https://github.com/your/repository.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    docker.build("your_docker_image_name")
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                // Push Docker image to Docker Hub
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_credentials') {
                        docker.image("your_docker_image_name").push("latest")
                    }
                }
            }
        }
        stage('Email Notification') {
            steps {
                // Send email notification
                emailext (
                    to: 'admin@example.com',
                    subject: 'Jenkins Job Successful',
                    body: 'The Dockerization job was successful.',
                )
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! Yay!'
        }
        failure {
            echo 'Pipeline failed! Please check the logs for more information.'
        }
    }
}
